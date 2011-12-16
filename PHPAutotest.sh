#!/bin/sh

allTestsOkIcon=/usr/share/icons/gnome/48x48/status/weather-clear.png
allTestsOkTitle="All tests passed"
allTestsOkMessage="Arr! Ye rock mate!"

someTestsFailedIcon=/usr/share/icons/gnome/48x48/status/weather-showers.png
someTestsFailedTitle="Some tests failed"
someTestsFailedMessage="Avast! Ye broke sumthin'!"

folderBeingWatched=$1
phpunitConfigPath=$2

if [ ! -z $folderBeingWatched ]; then

	if [ -z $phpunitConfigPath ]; then
		phpunitConfigPath=app/
	fi

	while [ true ]; do
		inotifywait -qq -e modify $folderBeingWatched -r
		if phpunit -c $phpunitConfigPath | tail -n3 | grep "OK"; then
			notify-send --hint=int:transient:1 --icon=$allTestsOkIcon "$allTestsOkTitle" "$allTestsOkMessage" --expire-time=1500
		else
			notify-send --hint=int:transient:1 --icon=$someTestsFailedIcon "$someTestsFailedTitle" "$someTestsFailedMessage" --expire-time=1500
		fi
	done
else
	echo "USAGE: PHPAutotest folderToLookForModifications [phpUnitConfigPath]"
fi
