require 'csv'

desc 'Import books from CSV file'
task :import => [:environment] do

  books = "lib/data/books.csv"

  CSV.foreach(books, :headers => true) do |row|
    book = Book.create!(row.to_hash)
    puts "Created Book ID #{book.id}: #{book.title} by Author #{book.author_first_name} #{book.author_last_name}"
  end

end
