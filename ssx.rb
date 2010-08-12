require 'rubygems'
require 'nokogiri'
require 'open-uri'

module Ssx
  
  class Engine
    
    def initialize((
    end

    def self.get_payload()
      "<script>document.write(\"<ssx>true</ssx>\")</script>"
    end


  end



end


module SsxInterface
  def self.scan(url)
    page = Nokogiri::HTML(open("http://#{url}/index.php?#{Ssx::Engine.get_payload}"))
    content = page.xpath("//ssx").collect(&:text)
    if content.include? "true" 
      puts "#{url} is vulnerable."
    end
  end
end

module Launch
  def self.usage
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

