require 'Time'
class Post
	def self.post_types
		[Memo, Link, Task]
	end 
	def self.create(type_index)
		return post_types[type_index].new	
	end
	def initialize
		@text = []
		@created_at = Time.now 
	end 
	def ukraine(lines)
		lines = lines.split(//)#ділить на массив
		w = ""
			for item in lines do #перевіряє массив на букву"і"
				if item == "?"
				w << "і"
				else 
				w << item
				end
			end
		line = w.to_s#збирає в масив
		@text << line
	end 

	def read_from_console
	end 

	def strings
	end

	def save
		file = File.new(file_path, "a")#стоврює файл якщо його не існує
		for item in strings do
			file.puts(item)#додає рядки до файлу
		end 
		file.close#зачиняє файл
	end

	def file_path
		current_path = File.dirname(__FILE__)#місце знахоження програми
		
		file_name = @created_at.strftime("#{self.class.name} %Y-%m-%d_%H-%M-%S .txt")#створює назву файлу
		return current_path + "/" + file_name#повертає шлях і назву
	end 
end 