require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    return @columns unless @columns.nil?
    @columns = DBConnection.execute2(<<-SQL)
      SELECT
        *
      FROM
        cats
    SQL

    @columns = @columns.first
    @columns.map {|col| col.to_sym}
  end

  def self.finalize!

  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    new_name = self.to_s[0].downcase
    # return nil if @table_name==''
    self.to_s[1..-1].each_char do |char|
      if char.upcase == char
        new_name += '_'+char.downcase
      else
        new_name += char
      end
    end
    new_name+"s"
  end

  def self.all
    # ...
  end

  def self.parse_all(results)
    # ...
  end

  def self.find(id)
    # ...
  end

  def initialize(params = {})
    # ...
  end

  def attributes
    # hash of all model's columns and values
    @attributes = {}
    self.columns.each do |col|
      @attributes[col] = self.col
    end
    @attributes
  end

  def attribute_values
    # ...
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
