# frozen_string_literal: true

require_relative "rings/version"
require 'thor'

module Rings
  class Error < StandardError; end
  class CLI < Thor
    class_option :config, aliases: :c, default: '', type: :string, desc: 'Set configration file'

    desc 'new', 'Generate New Project'
    def new
      puts 'New mode'
    end

    desc 'list', 'Show Projects list'
    def list
      puts 'List mode'
    end

    desc 'version', 'Show version.'
    def version
      puts "rings #{Rings::VERSION}"
    end
  end
end
