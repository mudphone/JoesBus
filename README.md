# This is Joe's Bus Library Tool Thing.

This is a tiny Ruby library for driving TheBus' public API.  To find out more, check out the [official HEA API docs](http://hea.thebus.org/api_info.asp "HEA API Page").

## Do the following:
* Sign up for an API key at [http://api.thebus.org](http://api.thebus.org)
* Copy config/config.yml.template to config/config.yml
* Enter your API key into the development section of config.yml

## Example Usage:
````ruby
$ irb -r './client.rb'

> client = JoesBus::Client.new
 => #<JoesBus::Client:0x007f86ad07f770 @user_config={:hea=>{:api_key=>"####"}}, @config={:api_key=>"#####"}>

> client.arrivals_response 123
using api key: #####
url is: http://api.thebus.org/arrivals/?key=#####&stop=123
 => ... TBD ...
````

More to come.

# LICENSE

I'm using the [Eclipse Public License](http://opensource.org/licenses/EPL-1.0 "Eclipse Public License") for now. This is the same license used by Clojure. Please let me know if you have other preferences.  Or, send a pull request.

See LICENSE.txt for license text (or the link above).

Copyright (c) 2013 The People of Hawaii
