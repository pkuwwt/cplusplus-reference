#!/bin/bash

handle() {
	dir=`dirname "$@"`
	dir=${dir##./}
	exp=`echo "$dir"| sed 's/[^/]\+/../g'`
	if [[ $dir == "." ]] then exp="." fi
	sed -i "s,http://www.cplusplus.com/v320,$exp/v320,g" "$@" 
	sed -i "s,show_ad,show_ad_,g" "$@" 
	sed -i "s,DonateBox,DonateBox_,g" "$@" 
}
export -f handle

find . -name '*.html' -exec bash -c 'handle "$0"' {} \;

