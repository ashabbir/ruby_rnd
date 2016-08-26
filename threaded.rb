require 'benchmark'


class Bla
  def initialize(label)
    @label = label
  end

  def call
    puts "#{@label} AAAA"
    100.times do |x|
      100.times{|a| a*x * 100 }
      sleep 0.00004
    end
    return "about to sleep in task labeled #{@label}\n"
  end
end

future = []
time = Benchmark.realtime do
  1000.times do |x|
    future[x] = Thread.new { Bla.new(x.to_s).call }
  end
end
future.each {|x| x.join }
puts time
