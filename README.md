smart-fan-control
=================

Control the speed of a Mac’s HDD fan based on the S.M.A.R.T. temperature reported by the drive.

### About

Inspired by [this hint](http://hints.macworld.com/article.php?story=20110704054835249), this script sets the speed of the HDD fan based on the temperature reported by the drive itself.

You might ask why?

* [Proprietary cable can put the brakes on upgrading Late ’09 iMacs](http://blog.macsales.com/2751-proprietary-cable-can-put-the-brakes-on-upgrading-late-09-imacs)
* [Apple Further Restricts Upgrade Options on New iMacs](http://blog.macsales.com/10146-apple-further-restricts-upgrade-options-on-new-imacs)
* [Further Explained: Apple’s iMac 2011 Model Hard Drive ‘Restrictions’](http://blog.macsales.com/10206-further-explained-apples-imac-2011-model-hard-drive-restrictions)

This script attempts to achieve something similar to [HDD Fan Control](http://www.hddfancontrol.com/), minus the price tag and nice GUI.

### Warning

Use this totally at your own risk. This is practically untested and has been knocked together pretty quickly. In fact, you shouldn't really even use this.

### Requirements

1.  <code>smartctl</code> from the [smartmontools](http://sourceforge.net/apps/trac/smartmontools/) package. I use [macports](http://www.macports.org/):
    
        $ port install smartmontools

2.  <code>smc</code> from [smcFanControl](http://www.eidac.de/?cat=40) (it's in Resources folder in the app package).

### Installation

    make install

<code>smc</code> needs to be owned by root with setuid.

    $ sudo chown root:admin smc
    $ sudo chmod +s smc

It makes sense to schedule this script to run at a regular interval. I use cron to run it every minute: <code>crontab -e</code>

    */1 * * * * /usr/local/sbin/smart-fan-control | logger -t 'smart-fan-control-cron'
