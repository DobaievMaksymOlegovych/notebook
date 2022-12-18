require 'Time'
class Post
	def self.post_types
		[Memo, Link, Task]
	end 
	def self.create(type_index)
		return post_types[type_index].new	
	end
	def initualize
		@text = nil
		@created_at = Time.now 
	end 

	def read_from_console
	end 

	def strings
	end

	def save
		file = File.new(file_path)
		for item in strings do
			file.puts(item)
		end 
		file.close
	end

	def file_path
		current_path = File.dirname(__FILE__)
		
		file_name = @created_at.strftime("#{self.class.name} %Y-%m-%d_%H-%M-%S .txt")
		return current_path + "/" + file_name
	end 
end 