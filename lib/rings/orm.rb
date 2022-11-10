# frozen_string_literal: true

require 'sequel'
require 'sqlite3'

module RingsDB
  def self.init
    SQLite3::Database.new Rings::DEFAULT_CONFIG[:db]
    db = Sequel.sqlite Rings::DEFAULT_CONFIG[:db]
    db.run 'CREATE TABLE items (name VARCHAR(255) NOT NULL)'
  end

  def self.new(name)
    db = Sequel.sqlite Rings::DEFAULT_CONFIG[:db]
    dataset = db[:items]
    dataset.insert(name: name)
  end

  def self.list
    db = Sequel.sqlite Rings::DEFAULT_CONFIG[:db]
    dataset = db[:items]
    puts dataset.all
  end
end
