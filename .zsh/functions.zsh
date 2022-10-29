##################################################
# Bashrc greetings				 #
##################################################

###### greeting: add birthdays and anniversaries if you want
# # get current hour (24 clock format i.e. 0-23)
hour=$(date +"%H")
# # if it is midnight to midafternoon will say G'morning
if [ $hour -ge 0 -a $hour -lt 12 ]
 then
  greet="Good Morning, $USER. Welcome back."
# # if it is midafternoon to evening ( before 6 pm) will say G'noon
elif [ $hour -ge 12 -a $hour -lt 18 ]
 then
  greet="Good Afternoon, $USER. Welcome back."
else # it is good evening till midnight
  greet="Good Evening, $USER. Welcome back."
fi
# # display greeting
echo $greet

###### holiday greeting
# # get current day (Month-Day Format)
day=$(date +"%B%e")
# # get current year (for new years greeting)
year=$(date +"%Y")
# # make sure the holiday greeting is displayed (if any)
hol=1
# # if it is New Year's Day
if [ "$day" = "January1" ]
 then
  holgreet="Happy New Years. Have a Happy $year."
# # if it is Valentine's Day
elif [ "$day" = "February14" ]
 then
  holgreet="Have a Happy Valentine's Day."
# # if it is Independance Day
elif [ "$day" = "July4" ]
 then
  holgreet="Have a Happy Forth of July."
## # if it is Halloween
elif [ "$day" = "October31" ]
 then
  holgreet="Happy Halloween."
# # if it is Christmas Eve
elif [ "$day" = "December24" ]
 then
  holgreet="Merry Christmas Eve."
# # if it is Christmas
elif [ "$day" = "December25" ]
 then
  holgreet="Merry Christmas."
# # if it is New Year's Eve
elif [ "$day" = "December31" ]
 then
  holgreet="Happy New Year's Eve."
else
  hol=0
fi
# # display holiday greeting
if [ "$hol" = "1" ]
 then
 echo $holgreet
elif [ "$hol" = "0" ]
 then
  randomvarthatsomehowimportant=0
fi


##################################################
# Network information and IP address stuff	 #
##################################################

###### get all IPs via ifconfig
function allips()
{
ifconfig | awk '/inet / {sub(/addr:/, "", $2); print $2}'
}

###### online check
function connected() { ping -c1 -w2 google.com > /dev/null 2>&1; }

###### show time since last reboot
function show_uptime() {
	# copyright 2007 - 2010 Christopher Bratusek
	case $1 in
		*help )
			echo -e "\n${ewhite}Usage:\n"
			echo -e "${eorange}show_uptime${ewhite} |${egreen} ! no options !\n"
			tput sgr0
		;;
		* )
			uptime=$(</proc/uptime)
			timeused=${uptime%%.*}
			if (( timeused > 86400 )); then
			((
				daysused=timeused/86400,
				hoursused=timeused/3600-daysused*24,
				minutesused=timeused/60-hoursused*60-daysused*60*24,
				secondsused=timeused-minutesused*60-hoursused*3600-daysused*3600*24
			))
				if (( hoursused < 10 )); then
					hoursused=0${hoursused}
				fi
				if (( minutesused < 10 )); then
					minutesused=0${minutesused}
				fi
				if (( secondsused < 10 )); then
					secondsused=0${secondsused}
				fi
				output="${daysused}d ${hoursused}h:${minutesused}m:${secondsused}s"
			elif (( timeused < 10 )); then
				output="0d 00h:00m:0$(timeused)s"
			elif (( timeused < 60 )); then
				output="0d 00h:00m:${timeused}s"
			elif (( timeused < 3600 )); then
			((
				minutesused=timeused/60,
				secondsused=timeused-minutesused*60
			))
				if (( minutesused < 10 )); then
					minutesused=0${minutesused}
				fi
				if (( secondsused < 10 )); then
					secondsused=0${secondsused}
				fi
				output="0d 00h:${minutesused}m:${secondsused}s"
			elif (( timeused < 86400 )); then
			((
				hoursused=timeused/3600,
				minutesused=timeused/60-hoursused*60,
				secondsused=timeused-minutesused*60-hoursused*3600
			))
				if (( hoursused < 10 )); then
					hoursused=0${hoursused}
				fi
				if (( minutesused < 10 )); then
					minutesused=0${minutesused}
				fi
				if (( secondsused < 10 )); then
					secondsused=0${secondsused}
				fi
				output="0d ${hoursused}h:${minutesused}m:${secondsused}s"
			fi
			echo "$output"
		;;
	esac
}