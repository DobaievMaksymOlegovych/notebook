require "./link.rb"
require "./memo.rb"
require "./task.rb"
require "./post.rb"
puts 'Вас вітає блокнот (версія 2)'
puts 'Що хочете занотувати?'

choices = Post.post_types.keys
choice = -1
until choice >= 0 && choice < choices.size#чекає від 0 до 2
	choices.each_with_index do |type, index|#необхідне для виводу 
	puts "\t#{index}. #{type}"#виводить порядковай номер і назву запису
	end
	choice = gets.chomp.to_i #приймає число для вибору 


entry = Post.create(choices[choice])
entry.read_from_console
end
id = entry.save_to_db
puts "Запис збережно id = #{id} "