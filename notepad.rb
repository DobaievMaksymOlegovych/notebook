require "./link.rb"
require "./memo.rb"
require "./task.rb"
require "./post.rb"
puts 'Вас вітає блокнот'
puts 'Що хочете занотувати?'

choices = Post.post_types
choice = -1
until choice >= 0 && choice < choices.size
	choices.each_with_index do |type, index|
	puts "\t#{index}. #{type}"
	end
	choice = gets.chomp.to_i 
end

entry = Post.create(choice)
entry.read_from_console
entry.save
puts 'Запис збережно'