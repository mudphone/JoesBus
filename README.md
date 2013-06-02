# This is Joe's Bus Library Tool Thing.

## Requirements

This library requires Ruby version >= 1.9.

### STATIC BUS SETUP

#### OSX Install the GTFS Gem
(GTFS is the Google Transit Feed Spcification.)
Install https://github.com/nerdEd/gtfs via Ruby Gems.

````bash
$ gem install gtfs
````

#### Google Transit Data Feed: Oahu Transit Services, Inc
Grab the static data, describing the bus system:
* http://code.google.com/p/googletransitdatafeed/wiki/PublicFeeds
* http://webapps.thebus.org/transitdata/Production/google_transit.zip

Load this data and use it:
````bash
$ cd JoesBus
$ irb
> require 'gtfs'
> source = GTFS::Source.build("./data/google_transit.zip")


# Do stuff with source... see the GTFS project on GitHub.

````

### REAL-TIME BUS SETUP

#### OSX Install of Protobuf and Ruby Protobuf
I'm following the instructions from the [localshred/protbuf](https://github.com/localshred/protobuf) readme.

#### Install Protobuf 2.4.1 (NOT 2.5.0) via Homebrew:
````bash
# Go to your brew directory (/usr/local for me)
$ cd `brew --prefix`

# List versions of protobuf
$ brew versions protobuf
2.5.0    git checkout 019364d Library/Formula/protobuf.rb
2.4.1    git checkout 544209f Library/Formula/protobuf.rb

# Check out version 2.4.1 of protobuf
$ git co 544209f Library/Formula/protobuf.rb

# Install this version
$ brew install protobuf
````

#### Install Protobuf Ruby Gem:
````bash
$ gem install protobuf
````

#### Convert gtfs-realtime.proto file to Ruby format:
````bash
$ cd JoesBus
$ rprotoc gtfs-realtime.proto --ruby_out ./lib
````

## How this works

API end points for Oahu Transit Services, Inc. - Google Transit Feed Specification: Real Time
* http://webapps.thebus.org/transitdata/production/vehloc/
* http://webapps.thebus.org/transitdata/production/tripupdates/
* http://webapps.thebus.org/transitdata/production/servicealerts/



## Example Usage:
````ruby
$ irb
> require 'protobuf'
 => true
> require './lib/gtfs-realtime.pb'
 ...
 => true

1.9.3-p362 :007 > require 'open-uri'
 => true

1.9.3-p362 :008 > url = "http://webapps.thebus.org/transitdata/production/vehloc/"
 => "http://webapps.thebus.org/transitdata/production/vehloc/"

1.9.3-p362 :009 > gtfs_bytes = open(url).read
 => "\n\r\n\x031...

> feed_message = Transit_Realtime::FeedMessage.new.parse_from_string(gtfs_bytes)
> msg_hash = feed_message.to_hash
> msg_header = msg_hash[:header]
> msg_entity = msg_hash[:entity]
> msg_entity[0]
 => {:id=>"031", :is_deleted=>false, :vehicle=>{:position=>{:latitude=>21.340709686279297, :longitude=>-158.0762939453125}, :timestamp=>1370140693, :vehicle=>{:id=>"031"}}}

# Each entity format differs depending on which API end point you hit (vehicle position, trip update, service alert).
# See URLs above.

> msg_entity[0].keys
 => [:id, :is_deleted, :vehicle]
> msg_entity[0][:vehicle].keys
 => [:position, :timestamp, :vehicle]
> msg_entity[0][:vehicle][:position].keys
 => [:latitude, :longitude]
````

````bash
# Vehicle Position FeedMessage
> pp e[0]; nil
{:id=>"031",
 :is_deleted=>false,
 :vehicle=>
  {:position=>{:latitude=>21.340709686279297, :longitude=>-158.0762939453125},
   :timestamp=>1370140693,
   :vehicle=>{:id=>"031"}}}
 => nil

# Service Alert FeedMessage Alert?
> pp e2.first; nil
{:id=>"rideralert_88_104",
 :is_deleted=>false,
 :alert=>
  {:active_period=>[{:start=>1368552600, :end=>253402164000}],
   :informed_entity=>
    [{:stop_id=>"297"},
     {:stop_id=>"874"},
     {:stop_id=>"3674"},
     {:stop_id=>"4547"},
     {:stop_id=>"4548"},
     {:stop_id=>"4549"}],
   :url=>
    {:translation=>
      [{:text=>"http://thebus.org/Updates/EventsShortTerm.asp",
        :language=>"en"}]},
   :header_text=>{:translation=>[{:text=>"Road Work", :language=>"en"}]},
   :description_text=>
    {:translation=>
      [{:text=>
         "For approximately three months, 24 hours a day 7 days a week, Route 13 will be reversed and will operate in a counter-clockwise direction around the University of Hawaii from Dole St/East-West Center Rd.  Board buses at stops across the street from the regular stops.",
        :language=>"en"}]}}}
 => nil


 # Trip Update Feed Message
 > pp e3[0]; nil
{:id=>"5663352.5031.874355",
 :trip_update=>
  {:trip=>{:trip_id=>"5663352.5031.874355"},
   :stop_time_update=>[{:stop_sequence=>1, :arrival=>{:delay=>0}}]}}
 => nil

````


More to come.


# NOTES



http://code.google.com/p/googletransitdatafeed/wiki/PublicFeeds
https://developers.google.com/transit/gtfs/reference
https://developers.google.com/transit/gtfs/

https://github.com/nerdEd/trimet-gtfs-realtime
https://github.com/reidab/trimet-gtfs-realtime

http://www.gtfs-data-exchange.com/agency/thebus/latest.zip

# LICENSE

I'm using the [Eclipse Public License](http://opensource.org/licenses/EPL-1.0 "Eclipse Public License") for now. This is the same license used by Clojure. Please let me know if you have other preferences.  Or, send a pull request.

See LICENSE.txt for license text (or the link above).

Copyright (c) 2013 The People of Hawaii
