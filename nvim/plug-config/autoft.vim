autocmd BufRead,BufNewFile *.tex set filetype=tex
autocmd FileType tex map <silent> <F5> :!pdflatex %<CR>
autocmd FileType tex map <silent> <F1> :!pdflatex % ; bibtex %:r ; makeindex -s %:r.ist -t %:r.glg -o %:r.gls %:r.glo; pdflatex %<CR>
autocmd FileType tex map <silent> <F2> :!make<CR>
autocmd FileType tex :setlocal spell spelllang=en_us
autocmd FileType tex :syntax spell toplevel
"autocmd FileType tex :set breakindent
"autocmd FileType tex :set formatoptions=l
"autocmd FileType tex :set lbr

autocmd FileType markdown :setlocal spell spelllang=en_us
autocmd FileType markdown map <silent> <F5> :!pandoc -f markdown % -Tpdf -C -o %:r.pdf<CR>
autocmd BufWritePre *.cpp,*.hpp,*.c,*.h lua vim.lsp.buf.formatting_sync()

autocmd FileType rmd :setlocal spell spelllang=en_us
autocmd FileType rmd map <silent> <F5> :!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<enter>

autocmd FileType ms :setlocal spell spelllang=en_us
autocmd FileType ms map <silent> <F5> :!groff -ms % -Tpdf > %:r.pdf

autocmd FileType cpp map <F1> :!g++ -Wall -O2 % -o %:r<CR>
autocmd FileType cpp map <F2> :!./%:r<CR>

autocmd FileType go map <F1> :!go run %<CR>
autocmd FileType go map <F2> :!go run %

autocmd FileType python map <F1> :!python %<CR>
autocmd FileType python map <F2> :!python %
