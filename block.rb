def say_it(&block)
  puts block
  puts 'in method'
  block.call if block_given?
  puts 'back in method'
  puts '*'*10
end

say_it { puts 'in block' }
say_it
say_it { }
