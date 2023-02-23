require 'Time'
require 'sqlite3'
class Post
	@@SQLITE_DB_FILE = 'notepad.sqlite'
	def self.post_types
		{'Memo' => Memo, 'Link' => Link, 'Task' => Task}
	end 
	def self.create(type)
		return post_types[type].new
	end

	def self.find(limit, type, id)
		db = SQLite3::Database.open(@@SQLITE_DB_FILE)
		if !id.nil?#якщо не порожнє
			db.results_as_hash = true#робить асоаційний масив 
			result = db.execute("SELECT * FROM posts WHERE rowid = ?", id )#запит до бази данних
			result = result[0] if result.is_a? Array #повертає перший знак якщо це масив 
			db.close #заериває базу данних
			if result.nil?#пепревіряє чи знайдено
				abort "Такий id #{id} не знайдено"
			else 
				post = create(result['type'])

				post.load_data(result)#метод витягує потрібні дані 
				return post 
			end 
		else
			db.results_as_hash = false 
			query = "SELECT rowid, * FROM posts "
			query += "WHERE type = :type " unless type.nil?
			query += "ORDER by rowid DESC "
			query += "LIMIT :limit " unless limit.nil?

			statement = db.prepare(query)
			statement.bind_param('type', type) unless type.nil? #заиіна плейсхолдера якщо не порожнє значення
			statement.bind_param('limit', limit) unless limit.nil? #заміна плейсхолдера якщо не порожнє значення

			result = statement.execute!
			statement.close
			db.close
			return result

		end

	end 
	def load_data(data_hash)
		@created_at = Time.parse(data_hash['created_at'])#зчитує двту створення

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


	def save_to_db
		db = SQLite3::Database.open(@@SQLITE_DB_FILE)
		db.results_as_hash = true #робить асоаційний масив
		db.execute(# звернення до БД
			"INSERT INTO posts(" +
			to_db_hash.keys.join(', ') +
			")" + 
			" VALUES (" +
			('?,'*to_db_hash.keys.size).chomp(',') + ")",
			to_db_hash.values
			)
		insert_rowid = db.last_insert_row_id# знаходить id і зберігає 
		db.close# закриває БД
		return insert_rowid
	end 

	def to_db_hash
		{
			'type' => self.class.name,
			'created_at' => @created_at.to_s
		}
	end

	  
end 