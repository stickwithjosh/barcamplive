# BarCampLive

*A Simple BarCamp Scheduler*

## Getting BarCampLive up and running

You'll need a few things to run BarCampLive, including the Ruby, Rake, Rails, and a tolernace for the command line. After satisfying these requirements run the following (note: all commands are being run from the root of the BarCampLive directory):

 * rake db:create
 * rake db:schema:load
 * rake populate:2009

This will give you something to look at / work with, although it will be the data set from BarCamp Orlando, 2009. Next you'll need to start the webrick development server, and check out the scheduling app in your web browser

 * ruby script/server
 * firefox http://localhost:3000
