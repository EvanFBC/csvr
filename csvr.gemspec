
Gem::Specification.new do |gem|
	gem.name = 'csvr'
	gem.version = '1.0.0'
	gem.date = '2015-06-24'
	gem.summary = 'Parsing CSV files to SQLite'
	gem.description = 'Parses CSV files to a custom SQLite Database, with custom headers and filtering'
	gem.authors = ['Andrew Smith']
	gem.email = 'a.smith@live.ca'
	gem.files = ['lib/csvr.rb', 'lib/csvr/parse.rb', 'lib/csvr/format.rb', 'lib/csvr/sqlitedb.rb', 'lib/csvr/cli.rb']
	gem.executables << 'csvr'
	gem.homepage = 'https://github.com/sm1th-/csvr.git'
	gem.license = 'MIT'
end
