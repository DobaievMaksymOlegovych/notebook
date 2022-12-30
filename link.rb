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
		@created_at = Time.now 
		time_string = "Створено: #{@created_at.strftime("%Y.%m.%d, %H:%M")} \n\r \n\r"#рядок створення
		return [@url, @text, time_string]#повертає 
	end 
end