require 'byebug'
require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    
    table_n = self.table_name
    if @result
      return @result
    else
      @result = DBConnection.execute2(<<-SQL)
        SELECT
          *
        FROM
          "#{table_n}"
      SQL
    
    @result = @result.first.map! {|col| col.to_sym}
    #debugger
    end
  end

  def self.finalize!
    columns.each do |col|  
      define_method("#{col}") { self.attributes[col] } #getter
      define_method("#{col}=") do |val| #setter
        self.attributes[col] = val
      end
      
    end
  end
  
  
  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    # split by uppercase and downcase the rest of each element
    # join with _  and add s 
    "#{self}s".downcase
    
  end

  def self.all
    
  end

  def self.parse_all(results)
    
  end

  def self.find(id)
    
  end

  def initialize(params = {})
    params.each do |attr_name,v|
      #debugger
      raise "unknown attribute '#{attr_name}'" unless self.class.columns.include?(attr_name)
      
      self.send("#{attr_name}=", v)
    end
  end

  def attributes
    @attributes ||= {}
    # self.finalize!
  end

  def attribute_values
    
  end

  def insert
    
  end

  def update
    
  end

  def save
    
  end
  
  
end
