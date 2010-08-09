require 'spec_helper'

describe "Imagebin" do
    before do
        @options = { "image" => "spec/ZGrass04.jpg",
                     "key" => "926e908c545620bd1c44d43edf3a35a0",
        }
    end

    it "should return a link to the picture file" do
        ibin = Imagebin.new(@options)
        link = ibin.original_image
        link.should match(/jpg/)
    end

    it "should raise an error" do
        @options['key'] = ''
        lambda {Imagebin.new(@options)}.should raise_error(RuntimeError)
    end
end
