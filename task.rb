require "./post.rb"
require 'date'
class Task < Post
	def initialize
		super
		@due_date = Time.now
	end

	def read_from_console
		puts 'Що потрібно зробити?'
		lines = gets.chomp
		ukraine(lines)
		puts 'До коли потрібно зробити?(в форматі ДД.ММ.РРРР'
		input = gets.chomp
		@due_date = Date.parse(input)
	end 

	def strings

		time_string = "Створено: #{@created_at.strftime("%Y.%m.%d, %H:%M")} \n\r \n\r"#рядок створення
		deadline = "Кінецева дата: #{@due_date}"
		return [deadline, @text, time_string]#повертає
	end 
end