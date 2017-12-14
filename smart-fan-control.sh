#!/bin/sh

#
# Get the disk temperature as reported by via smartmontools.
#
# My drive is from Seagate.
#
# * Seagate S.M.A.R.T. Attributes — https://www.smartmontools.org/wiki/AttributesSeagate
# * http://wl500g.info/showthread.php?10488-HOWTO-install-hddtemp&p=94762#post94762
#
TEMP=$(/opt/local/sbin/smartctl -A /dev/disk0 | grep ^194 | awk '{print $10}')

#
# Depending on the actual temperature set a value for the desired fan speed.
#
if [ $TEMP -le 31 ]
then
	SPEED=1100
elif [ $TEMP -le 33 ]
then
	SPEED=1200
elif [ $TEMP -le 35 ]
then
	SPEED=1500
elif [ $TEMP -le 38 ]
then
	SPEED=2600
elif [ $TEMP -le 41 ]
then
	SPEED=3500
elif [ $TEMP -le 44 ]
then
	SPEED=4000
elif [ $TEMP -le 52 ]
then
	SPEED=5000
else
	SPEED=6200
fi

#
# Convert desired speed to hex.
#
HEXSPEED=$(python -c "print hex($SPEED << 2)[2:]")

#
# Print findings.
#
echo "Drive temperature is $TEMP. Setting fan speed to $SPEED"

#
# Issue command to set the maximum fan speed.
#
# Note: I'm setting the **maximum** fan speed here to bring the speed down
# from an artifically high level. This is needed on my iMac, which otherwise
# would have the HDD fan running at max (6000+) all the time.
#
/usr/local/sbin/smc -k F1Mx -w $HEXSPEED

# End of script.
