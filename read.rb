require "./post.rb"
require "./link.rb"
require "./memo.rb"
require "./task.rb"
require 'optparse'
options = {}

OptionParser.new do |opt|
	opt.banner = 'Usade: read.rb [options]'

	opt.on('-h', 'Prints this help') do 
		puts opt 
		exit 
	end 

	opt.on('--type POST_TYPE', 'Який тип постів показати? (По стандарту всі)' ) { |o| options[:type] = o}
	opt.on('--id POST_ID', 'Якщо вказаний id, то показує цей пост.') { |o| options[:id] = o}
	opt.on('--limit NUMBER', 'Скільки останніх постів показати? (По стандарту всі)') { |o| options[:limit] = o}
end.parse!

result = Post.find(options[:limit], options[:type], options[:id])

if result.is_a? Post

	puts "Запис #{result.class.name}, id = #{options[:id]}"
	result.strings.each do |line|
		puts line
	end 
else
	print "|id\t| @type\t| @created_at@\t| @text\t| @due_date\t| url\t|"
	result.each do |rowid|
		puts

		rowid.each do |element|
			print "| #{element.to_s.delete("\n\r")[0..10]}\t"
		end 
	end 

end 
