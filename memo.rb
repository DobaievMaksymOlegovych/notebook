require "./post.rb"
class Memo < Post
	
	
	

	def read_from_console
		puts 'Введіть текст замітки. Для закінчення введіть "все".'
		lines = nil
		while lines != 'все' do
			lines = gets.chomp
			ukraine(lines)#
		end 
		
		@text.pop
	end 

	def strings
		
		time_string = "Створено: #{@created_at.strftime("%Y.%m.%d, %H:%M")} \n\r \n\r"#рядок коли стврено
		return @text << time_string# додає до тексту
	end 

end