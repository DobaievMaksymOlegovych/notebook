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
		@text = gets.chomp
	end 

	def strings
		time_string = "Створено: #{@created_at.strftime("%Y.%m.%d, %H:%M")} \n\r \n\r"
		return [@url, @text, time_string]
	end 
end