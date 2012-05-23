smart-fan-control
=================

Inspired by [this hint](http://hints.macworld.com/article.php?story=20110704054835249), this script sets the speed of the HDD fan based on the temperature reported by the drive itself.

This script attempts to achieve something similar to [HDD Fan Control](http://www.hddfancontrol.com/), minus the price tag and nice GUI.

### Warning

Use this totally at your own risk. This is practically untested and has been knocked together pretty quickly. In fact, you probably shouldn't even use this.

### Requirements

<code>smartctl</code> from the [smartmontools](http://sourceforge.net/apps/trac/smartmontools/) package. I use [macports](http://www.macports.org/):

    $ port install smartmontools

<code>smc</code> from [smcFanControl_2_3](http://www.eidac.de/?cat=40) (it's in Resources folder in the app package).

If you copy <code>smc</code>, it needs to be owned by root with setuid, otherwise run this script as root.

    $ sudo chown root:admin smc
    $ sudo chmod +s smc

### See also

* http://horstr.blogspot.co.uk/2008/04/dont-throw-your-macbook-air-out-just.html

