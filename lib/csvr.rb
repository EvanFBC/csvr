require_relative 'csvr/parse'
require_relative 'csvr/format'
require_relative 'csvr/sqlitedb'
require_relative 'csvr/cli'

module CSVR

	module_function

	def open(file)
		return App.new(file)
	end

	class App 

		include CSVR::Parse
		include Format 

		attr_reader :file, :rows
		attr_accessor :headers, :filters

		def initialize(file)
			@file = file
		end

		def parse
			@headers ||= CSVR::Parse.headers(@file)
			@rows = CSVR::Parse.rows(@file, @headers, @filters)
		end

		def format
			@headers = Format.headers(@headers)
			@rows = @rows.map{ |row| Format.row(row) }
		end

		def create(db, table)
			self.parse
			self.format
			db = Database.new(db, table, @headers, @rows)
			db.create
		end
	end
end

