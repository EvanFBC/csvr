require 'minitest/autorun'
require 'csvr'
require 'csvr/format'

describe "CSVR", "Testing proper argument types for parsing" do

  before do
    puts "Testing"
    @csvr = CSVR.open('test.csv')
    @csvr.parse
  end

  it "should contain a headers variable that is an array" do
    @csvr.headers.class.must_equal Array
  end

  it "should contain a rows variable that is an array of hashes" do
    @csvr.rows.class.must_equal Array
    @csvr.rows.each { |x| x.class.must_equal Hash }
  end

  it "should format headers into a string" do
    Format.headers(@csvr.headers).class.must_equal String
  end

  it "should format each row into a string" do
    Format.row(@csvr.rows[2]).class.must_equal String
  end

end
