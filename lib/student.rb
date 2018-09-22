require_relative "../config/environment.rb"
require 'active_support/inflector'
require 'interactive_record.rb'

class Student < InteractiveRecord

  def self.table_name
    self.downcased.pluralized
  end

  def self.column_names

  end

  def initialize

  end

end
