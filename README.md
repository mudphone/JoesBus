# This is Joe's Bus Library Tool Thing.

## Requirements

This library requires Ruby version >= 1.9.

### STATIC BUS SETUP

#### OSX Install of Protobuf and Ruby Protobuf
Installting https://github.com/nerdEd/gtfs via Ruby Gems:

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
$ source = GTFS::Source.build("./data/google_transit.zip")
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

1.9.3-p362 :009 > x = open(url).read
 => "\n\r\n\x031...

> fm = Transit_Realtime::FeedMessage.new.parse_from_string(x)
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
