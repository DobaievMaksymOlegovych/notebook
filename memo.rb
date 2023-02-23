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
		
		return @text <<  time_string# додає до тексту
	end 

	def to_db_hash
		return super.merge(
		{
			'text' => @text.join('\n\r')#
		})
	end 

	def load_data(data_hash)
		super(data_hash)
		@text = data_hash['text'].split("\n\r")[0..4 ]# знаходить текст та зберігає 
	end 

end