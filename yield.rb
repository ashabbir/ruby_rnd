def say_it
  puts 'in #say_id'
  yield if block_given?
  puts 'back in #say_it'
  puts '*'*10
end


say_it { puts 'in block' }
say_it
say_it { }
