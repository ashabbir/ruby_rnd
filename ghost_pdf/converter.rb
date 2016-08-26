require 'rghost'
require 'pry'
require 'open-uri'

f = File.new(
    open('http://www.pt.cision.com/o4kptwebnewlayout/clippings/2016_06/868260ec-2be2-412b-afb0-43914dea5b0a.pdf')
  )

RGhost::Convert.new(f).to(
  :jpeg, multipage: true,
  filename: 'a.jpeg',
  :resolution => 200
)
files = Dir.glob('*.jpeg')
files.each {|f| File.delete f }
