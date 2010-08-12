#!/usr/env/ruby

# SSX is a XSS scanner written in Ruby, using nokogiri.
# It fetches pages and scans them for XSS vulnerabilities.

require 'rubygems'
require 'nokogiri'
require 'open-uri'

# the actual scanning mechanism
module Ssx

end


module SsxInterface
  def self.scan(url)
    # fetch the page, 
    page = Nokogiri::HTML(open("http://#{url}"))
    # get the script-tags contents
    content = page.xpath("//script").collect(&:text)
    puts content
    

  end
end

module Launch
  def self.usage
    puts "\n(c) 2010 by thex00 - Ssx, a really lame XSS scanner. \n You need to give a url with it though!\n\n\n"
    puts "Example: ssx \'www.example.com\'. \n\n\nOh, what you break isn\'t my fault, but your own. USE AT OWN RISK\n\n"
  end

  def self.main(argument)
    SsxInterface.scan(argument)
  end
end

if $0 == __FILE__ 
  if(ARGV.empty?)
    Launch.usage
  else
    begin
    safe_url = URI::parse(ARGV[0])
    Launch.main safe_url
    rescue
      puts "Invalid url/ip"
    end
  end
end

