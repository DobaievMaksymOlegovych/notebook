require "./post.rb"
class Link < Post

	def initialize
		super
		@url = ''
	end

	def read_from_console
		puts 'Електроне посилання'
		@url = gets.chomp
		puts 'Опис посилання'
		lines = gets.chomp
		ukraine(lines)#замінює "?" на "і"
	end 

	def strings
		time_string = "Створено: #{@created_at.strftime("%Y.%m.%d, %H:%M")} \n\r \n\r"#рядок створення
		return [@url, @text, time_string]#повертає 
	end 

	def to_db_hash
		return super.merge(
		{
			'text' => @text,
			'url' => @url
		})
	end 

	def load_data(data_hash)
		super(data_hash)#доповняє батьківський метод
		@text = data_hash['text']#шукає та зберігає
		@url = data_hash['url']#шукає та зберігає
	end
end