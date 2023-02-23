require "./post.rb"
require 'date'
class Task < Post

	def read_from_console
		puts 'Що потрібно зробити?'
		lines = gets.chomp
		ukraine(lines)
		puts 'До коли потрібно зробити?(в форматі ДД.ММ.РРРР)'
		input = gets.chomp
		@due_date = Date.parse(input)
	end 

	def strings
		time_string = "Створено: #{@created_at.strftime("%Y.%m.%d, %H:%M")} \n\r \n\r"#рядок створення
		deadline = "Кінецева дата: #{@due_date}"
		return [@text, deadline, time_string]#повертає
	end 
	def to_db_hash
		return super.merge(
		{
			'text' => @text,
			'due_date' => @due_date.to_s
		})
	end
	def load_data(data_hash)
		super(data_hash)
		@due_date = Time.parse(data_hash['due_date'])# шукає перетворює і зберігає
		@text = data_hash['text']#знаходить і зберігає


	end 
end