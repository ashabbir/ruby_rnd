require 'classifier-reborn'
require 'pry'

lsi = ClassifierReborn::LSI.new
strings = [ ["This text deals with dogs. Dogs.", :dog],
            ["This text involves dogs too. Dogs! ", :dog],
            ["This text revolves around cats. Cats.", :cat],
            ["This text also involves cats. Cats!", :cat],
            ["This text involves birds. Birds.",:bird ]]
strings.each {|x| lsi.add_item x.first, x.last}

#puts lsi.search("dog", 3)
puts lsi.find_related("This Text involves dogs too", 2)
binding.pry
puts lsi.classify "My dog is a happy puppy"
