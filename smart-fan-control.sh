#!/bin/sh

#
# Get the disk temperature as reported by via smartmontools.
#
# My drive is from Seagate.
#
# * Seagate S.M.A.R.T. Attributes — http://sourceforge.net/apps/trac/smartmontools/wiki/AttributesSeagate
# * http://wl500g.info/showthread.php?10488-HOWTO-install-hddtemp&p=94762#post94762
#
TEMP=$(/opt/local/sbin/smartctl -A /dev/disk0 | grep ^194 | awk '{print $10}')

#
# Depending on the actual temperature set a value for the maximum fan speed.
#
if [ $TEMP -le 32 ]
then
	SPEED=1200
elif [ $TEMP -le 35 ]
then
	SPEED=1500
elif [ $TEMP -le 38 ]
then
	SPEED=2500
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

echo "Drive temperature is $TEMP. Setting fan speed to $SPEED (hex $HEXSPEED)"

#
# Issue command to set the maximum fan speed.
#
/usr/local/sbin/smc -k F1Mx -w $HEXSPEED

# End of script.