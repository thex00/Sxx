require 'ssx'

describe "Ssx" do
  it "must connect to a remote host and fetch page" do
    SsxInterface.scan("www.informationleak.net")
  end
  


end
