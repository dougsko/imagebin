#!/usr/bin/env ruby
#
# imagebin.ca class
#

require 'rubygems'
require 'httpclient'
require 'hpricot'

class Imagebin
    # This method takes a hash containing the variables in the POST
    # request.
    #
    #   ibin = Imagebin.new( { "t" => "file",
    #                          "name" => "",
    #                          "tags" => "",
    #                          "description" => "",
    #                          "adult" => "f",
    #                          "f" => "file_path",
    #                        }) 
    #
    def initialize(options)
        File.open(options["f"]) do |file|
            options["f"] = file
            clnt = HTTPClient.new
            res = clnt.post('http://imagebin.ca/upload.php', options).content
            @doc = Hpricot(res)
        end
    end

    # Returns the link to the HTML site of the post.
    #
    #   ibin.site_link    #=> "http://imagebin.ca/view/xxxxxxx.html"
    #
    def site_link
        @doc.at("a").innerHTML
    end

    # Returns the direct link to the dile posted.
    #
    #   ibin.pic_link    #=> "http://imagebin.ca/img/xxxxxxx.jpg"
    #
    def pic_link
        clnt = HTTPClient.new
        res = clnt.get(@doc.at("a").innerHTML).content
        doc = Hpricot(res)
        doc.at("#theimg")["src"]
    end
end
