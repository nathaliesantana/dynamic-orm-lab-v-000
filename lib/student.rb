require_relative "../config/environment.rb"
require 'active_support/inflector'
require 'interactive_record.rb'
require 'pry'

class Student < InteractiveRecord

  def self.table_name
    self.to_s.downcase.pluralize
  end

  def self.column_names
    sql = "PRAGMA table_info('#{table_name}')"

    table_info = DB[:conn].execute(sql)
    column_names = []

    table_info.each do |column|
      column_names << column['name']
    end

    column_names.compact

  end


  def initialize(options={})
    options.each do |property, value|
      self.send("#{property}=", value)
    end
  end


  self.column_names.each { |attribute| attr_accessor attribute.to_sym }

  def table_name_for_insert
  self.class.table_name
  end

  def col_names_for_insert
    self.class.column_names.delete_if {|col| col == "id"}.join (", ")
  end

  def values_for_insert

  end

end
