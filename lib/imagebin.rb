#!/usr/bin/env ruby
#
# imagebin.ca class
#

require 'rubygems'
require 'httpclient'

class Imagebin
    def initialize(options)
        @clnt = HTTPClient.new("http://imagebin.ca/upload.php")
        yield @clnt.post('http://imagebin.ca/upload.php', options).content.match(/http.+?\.html/)
    end
end
