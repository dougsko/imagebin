#!/usr/bin/env ruby
#
# imgur.com API
#
require 'rubygems'
require 'httpclient'
require 'rexml/document'

class Imagebin
    include REXML

    def initialize(options)
        @options = { "image" => "file",
                     "key" => "api_key",
        }
        @options.merge!(options)
        res = HTTPClient.post('http://imgur.com/api/upload.xml',
                              {:image => File.open(@options['image']),
                               :key => @options['key']}).content
        @doc = Document.new(res)
        raise @doc.elements.to_a("//error_msg")[0].text if @doc.elements.to_a("//error_msg").length > 0
    end

    def image_hash
        @doc.elements.to_a("//image_hash")[0].text
    end

    def delete_hash
        @doc.elements.to_a("//delete_hash")[0].text
    end

    def original_image
        @doc.elements.to_a("//original_image")[0].text
    end

    def large_thumbnail
        @doc.elements.to_a("//large_thumbnail")[0].text
    end

    def small_thumbnail
        @doc.elements.to_a("//small_thumbnail")[0].text
    end

    def imgur_page
        @doc.elements.to_a("//imgur_page")[0].text
    end

    def delete_page
        @doc.elements.to_a("//delete_page")[0].text
    end

end
