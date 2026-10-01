-- Install and configure plugins with vim.pack (Neovim 0.12+).
-- Specs live in lua/plugins/*.lua. A file returns one spec or a list of specs:
--   src: git clone URL
--   name: pack directory, when it should differ from the repository name
--   version: branch, tag, commit, or vim.version.range()
--   config: called once every plugin is on the runtimepath (higher priority first)
--   build: called after an install or update
--   priority: config order, higher first (default 50)
--
-- Update with :packupdate. vim.pack writes stdpath("config") .. "/nvim-pack-lock.json".
-- That path is read-only under home-manager, so it is a symlink to
-- stdpath("data") .. "/nvim-pack-lock.json".

if vim.pack == nil then
  error("vim.pack is unavailable; Neovim 0.12 or newer is required")
end

local function redirect_lockfile()
  local config_lock = vim.fs.joinpath(vim.fn.stdpath("config"), "nvim-pack-lock.json")
  local data_lock = vim.fs.joinpath(vim.fn.stdpath("data"), "nvim-pack-lock.json")
  vim.fn.mkdir(vim.fn.stdpath("data"), "p")

  -- vim.pack always opens the config path. Home-manager deploys that file as a
  -- read-only symlink, so keep the real lockfile in stdpath("data")
  -- (~/.local/share/nvim) and point the config path at it.
  if not vim.uv.fs_stat(data_lock) and vim.uv.fs_stat(config_lock) then
    local src = vim.uv.fs_stat(config_lock)
    local fd = vim.uv.fs_open(config_lock, "r", 438)
    if not fd then
      error("failed to read the pack lockfile at " .. config_lock)
    end
    local contents = vim.uv.fs_read(fd, src.size) or ""
    vim.uv.fs_close(fd)
    local out = vim.uv.fs_open(data_lock, "w", 438)
    if not out then
      error("failed to create the pack lockfile at " .. data_lock)
    end
    vim.uv.fs_write(out, contents)
    vim.uv.fs_close(out)
  end

  local existing = vim.uv.fs_stat(data_lock)
  if existing and bit.band(existing.mode, tonumber("200", 8)) == 0 then
    vim.uv.fs_chmod(data_lock, tonumber("644", 8))
  end

  local stat = vim.uv.fs_lstat(config_lock)
  if stat and stat.type == "link" and vim.uv.fs_readlink(config_lock) == data_lock then
    return
  end
  if stat then
    local ok, err = vim.uv.fs_unlink(config_lock)
    if not ok then
      error(("failed to replace read-only pack lockfile %s: %s"):format(config_lock, err))
    end
  end
  local ok, err = vim.uv.fs_symlink(data_lock, config_lock)
  if not ok then
    error(("failed to link the pack lockfile to %s: %s"):format(data_lock, err))
  end
end

redirect_lockfile()

local config_index = 0
local plugins = {}
local plugins_by_name = {}

local function plugin_name(spec)
  if type(spec.name) == "string" and spec.name ~= "" then
    return spec.name
  end
  local src = spec.src:gsub("%.git$", "")
  return assert(src:match("[^/]+$"), "cannot derive a plugin name from " .. spec.src)
end

local function versions_match(a, b)
  if a == nil or b == nil or a == b then
    return true
  end
  return tostring(a) == tostring(b)
end

local function add_spec(spec)
  if type(spec) ~= "table" or type(spec.src) ~= "string" then
    return
  end

  local name = plugin_name(spec)
  local existing = plugins_by_name[name]
  if existing == nil then
    existing = {
      src = spec.src,
      name = name,
      version = spec.version,
      build = spec.build,
      configs = {},
    }
    plugins_by_name[name] = existing
    plugins[#plugins + 1] = existing
  else
    if existing.src ~= spec.src then
      error(("conflicting sources for %s:\n%s\n%s"):format(name, existing.src, spec.src))
    end
    if not versions_match(existing.version, spec.version) then
      error(("conflicting versions for %s:\n%s\n%s"):format(
        name,
        tostring(existing.version),
        tostring(spec.version)
      ))
    end
    if existing.version == nil then
      existing.version = spec.version
    end
    if spec.build ~= nil then
      if existing.build ~= nil then
        error("multiple build hooks for " .. name)
      end
      existing.build = spec.build
    end
  end

  if spec.config ~= nil then
    config_index = config_index + 1
    existing.configs[#existing.configs + 1] = {
      fn = spec.config,
      priority = spec.priority or 50,
      index = config_index,
    }
  end
end

local plugin_dir = vim.fs.joinpath(vim.fn.stdpath("config"), "lua", "plugins")
for filename, filetype in vim.fs.dir(plugin_dir) do
  -- Home-manager deploys these modules as symlinks. vim.fs.dir() reports those as "link".
  if (filetype == "file" or filetype == "link") and filename:match("%.lua$") then
    local mod = require("plugins." .. filename:gsub("%.lua$", ""))
    if type(mod) == "table" and type(mod.src) == "string" then
      add_spec(mod)
    elseif type(mod) == "table" then
      for _, spec in ipairs(mod) do
        add_spec(spec)
      end
    end
  end
end

local builds = {}
for _, plugin in ipairs(plugins) do
  if plugin.build ~= nil then
    builds[plugin.name] = plugin.build
  end
end

vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    local build = builds[ev.data.spec.name]
    if build == nil or (ev.data.kind ~= "install" and ev.data.kind ~= "update") then
      return
    end
    if not ev.data.active then
      vim.cmd.packadd(ev.data.spec.name)
    end
    local ok, err = pcall(build, ev.data.path)
    if not ok then
      vim.notify(("plugin build failed for %s:\n%s"):format(ev.data.spec.name, err), vim.log.levels.ERROR)
    end
  end,
})

local specs = {}
for _, plugin in ipairs(plugins) do
  local spec = { src = plugin.src, name = plugin.name }
  if plugin.version ~= nil then
    spec.version = plugin.version
  end
  specs[#specs + 1] = spec
end

vim.pack.add(specs, { confirm = false })

local configs = {}
for _, plugin in ipairs(plugins) do
  for _, config in ipairs(plugin.configs) do
    configs[#configs + 1] = config
  end
end
table.sort(configs, function(a, b)
  if a.priority ~= b.priority then
    return a.priority > b.priority
  end
  return a.index < b.index
end)
for _, config in ipairs(configs) do
  config.fn()
end
