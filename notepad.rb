require "./link.rb"
require "./memo.rb"
require "./task.rb"
require "./post.rb"
puts 'Вас вітає блокнот'
puts 'Що хочете занотувати?'

choices = Post.post_types
choice = -1
until choice >= 0 && choice < choices.size#чекає від 0 до 2
	choices.each_with_index do |type, index|#необхідне для виводу 
	puts "\t#{index}. #{type}"#виводить порядковай номер і назву запису
	end
	choice = gets.chomp.to_i #приймає число для вибору 
end

entry = Post.create(choice)
entry.read_from_console
entry.save
puts 'Запис збережно'