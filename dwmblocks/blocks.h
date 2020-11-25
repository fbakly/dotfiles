//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	{"  ", 	"sudo pacman -Sy | pacman -Qu | wc -l", 			60, 	0},

	{"MEMORY ", "free -m | awk \'/Mem/ \{print $3\"/\"$2 \" MB\"\}\'", 	1, 	0},

	{"﨎", 	"expr $(cat /sys/class/thermal/thermal_zone0/temp) / 1000", 	1, 	0},

	{"直 ", 	"iwgetid -r", 			60, 	0},

	{" ", 	"cat /sys/class/power_supply/BAT*/capacity | tr '\n' ' '", 60, 0},

	{"墳 ", 	"pamixer --get-volume", 0, 	10},

	{" ", 	"date +\"%H:%M| %d-%m-%Y\"", 		30, 	0},

	//{"  ", 	"date +\"%d-%m-%Y\"", 	3600, 	0},
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim = '|';
