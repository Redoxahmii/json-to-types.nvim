#!/bin/sh

if [ ! "$1" ]; then
	echo 'Must provide node.js package manager'
	exit
fi

$1 install
