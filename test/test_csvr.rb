require 'minitest/autorun'
require 'csvr'
require 'csvr/format'

describe "CSVR", "Testing proper argument types for parsing" do

  before do
    @csvr = CSVR.open('test.csv')
    @csvr.parse
  end

  after do
    File.delete('testerdb.db') if File.exist?('testerdb.db')
  end

  it "should contain a headers variable that is an array" do
    @csvr.headers.class.must_equal Array
  end

  it "should contain a rows variable that is an array of hashes" do
    @csvr.rows.class.must_equal Array
    @csvr.rows.each { |x| x.class.must_equal Hash }
  end

  it "should contain a types variable that is a hash" do
    @csvr.types.class.must_equal Hash
  end

  it "should format headers into a string" do
     Format.headers(@csvr.headers, @csvr.types).class.must_equal String
  end

  it "should format each row into a string" do
    Format.row(@csvr.rows[2]).class.must_equal String
  end

  it "should insert correct data types into db" do
    @csvr.create("testerdb", "table1")
    File.exist?("testerdb.db").must_equal true
  end
end

describe "CSVR", "Filtering behaviour" do

  before do
    @csvr = CSVR.open('test.csv')
  end

  after do
    File.delete('testerdb.db') if File.exist?('testerdb.db')
  end

  it "should filter rows" do
    @csvr.filters = ['row3-4']
    @csvr.create("testerdb", "table1")
  end

  it "should parse out columns" do
    @csvr.headers = ['header1', 'header3']
    @csvr.create("testerdb", "table1")
  end
  
end
