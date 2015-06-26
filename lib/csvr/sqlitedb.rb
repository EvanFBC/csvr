require 'sqlite3'

class Database

	attr_reader :db, :table, :headers, :rows

	def initialize(db, table, headers, rows)
		@db = db
		@table = table
		@headers = headers
		@rows = rows
	end

	def create

		puts "Inserting #{@rows.size} rows into database"

		db = SQLite3::Database.open("#{@db}.db")
		db.execute "CREATE TABLE IF NOT EXISTS #{@table}(#{@headers})"
		@rows.each { |row| db.execute "INSERT INTO #{@table} #{row}" }
		db.close
	end

end
