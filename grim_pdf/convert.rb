require 'grim'
require 'pry'
require 'open-uri'



#pdf = Grim.reap("a.pdf")
pdf = Grim.reap(
  File.new(
    open('http://www.pt.cision.com/o4kptwebnewlayout/clippings/2016_06/868260ec-2be2-412b-afb0-43914dea5b0a.pdf')
  )
)
pdf.each_with_index do |page, i|
  puts 'c'
  page.save("images/#{i}.png")
end

binding.pry
puts 'a'
