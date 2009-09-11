require 'spec_helper'

describe "Imagebin" do
    before do
        options = { "t" => "file",
                    "name" => "",
                    "tags" => "",
                    "description" => "",
                    "adult" => "t",
                    "f" => "spec/ZGrass04.jpg",
        }
        @ibin = Imagebin.new(options)
    end

    it "should return a link to the paste's website" do
        link = @ibin.site_link
        link.should match(/html/)
    end

    it "should return a link to the picture file" do
        link = @ibin.pic_link
        link.should match(/jpg/)
    end
end
