#!/usr/bin/env ruby
#
# imgur.com API
#

require 'rubygems'
require 'httpclient'
require 'hpricot'

class Imagebin
    def initialize(options)
        @options = { "image" => "file",
                     "key" => "api_key",
        }
        @options.merge!(options)
        File.open(@options["image"]) do |file|
            @options["image"] = file
            clnt = HTTPClient.new
            res = clnt.post('http://imgur.com/api/upload.xml', @options).content
            @doc = Hpricot(res)
            raise @doc.at('error_msg').innerHTML if @doc.at('error_msg') != nil
        end
    end

    def image_hash
        @doc.at('image_hash').innerHTML
    end

    def delete_hash
        @doc.at('delete_hash').innerHTML
    end

    def original_image
        @doc.at("original_image").innerHTML
    end

    def large_thumbnail
        @doc.at('large_thumbnail').innerHTML
    end

    def small_thumbnail
        @doc.at('small_thumbnail').innerHTML
    end

    def imgur_page
        @doc.at('imgur_page').innerHTML
    end

    def delete_page
        @doc.at('delete_page').innerHTML
    end

end
