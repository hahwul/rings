# frozen_string_literal: true

require_relative 'rings/version'
require_relative 'rings/config'
require_relative 'rings/orm'
require 'thor'
require 'yaml'

module Rings
  class Error < StandardError; end

  class CLI < Thor
    class_option :config, aliases: :c, default: '', type: :string, desc: 'Set configration file'
    class_option :workspace, aliases: :w, default: '', type: :string, desc: 'Workspace'

    desc 'init', 'Initialize config and workspace'
    def init
      puts 'Init mode'
      if File.exist? Rings::DEFAULT_CONFIG[:base]
        puts "Exist basepath in #{Rings::DEFAULT_CONFIG[:base]}"
      else
        puts "Create a basepath in #{Rings::DEFAULT_CONFIG[:base]}"
        Dir.mkdir Rings::DEFAULT_CONFIG[:base]
      end

      if File.exist? Rings::DEFAULT_CONFIG[:config]
        puts "Exist default config in #{Rings::DEFAULT_CONFIG[:config]}"
      else
        puts "Create a default config in #{Rings::DEFAULT_CONFIG[:config]}"
        File.write Rings::DEFAULT_CONFIG[:config], Rings::DEFAULT_CONFIG.to_yaml
      end

      if File.exist? (Rings::DEFAULT_CONFIG[:db]).to_s
        puts "Exist database file in #{Rings::DEFAULT_CONFIG[:db]}"
      else
        RingsDB.init
        puts "Create a database file in #{Rings::DEFAULT_CONFIG[:db]}"
      end

      workspace = options.workspace
      workspace = Rings::DEFAULT_CONFIG[:workspace] if workspace == ''

      if File.exist? workspace
        puts "Exist workspace #{workspace}"
      else
        puts "Create a workspace in #{workspace}"
        Dir.mkdir workspace
      end
    end

    desc 'new', 'Generate New Project'
    def new(name)
      config = options.config
      config = Rings::DEFAULT_CONFIG[:config] if options.config == ''

      workspace = options.workspace
      workspace = Rings::DEFAULT_CONFIG[:workspace] if workspace == ''

      RingsDB.new name
    end

    desc 'list', 'Show Projects list'
    def list
      puts 'List mode'
      RingsDB.list
    end

    desc 'version', 'Show version.'
    def version
      puts "rings #{Rings::VERSION}"
    end

    def self.exit_on_failure?
      true
    end
  end
end
