require "./post.rb"
class Memo < Post
	@text = []
	def read_from_console
		puts 'Введіть текст замітки. Для закінчення введіть "все".'
		line = nil
		while line != 'все' do
			line = gets.chomp
			@text >> line
		end 
		@text.pop
	end 

	def strings
		time_string = "Створено: #{@created_at.strftime("%Y.%m.%d, %H:%M")} \n\r \n\r"
		return @text.unshift(time_string )
	end 

end