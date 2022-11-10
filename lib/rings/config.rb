# frozen_string_literal: true

module Rings
  DEFAULT_CONFIG = {
    workspace: "#{Dir.home}/.rings/workspace/",
    config: "#{Dir.home}/.rings/default.yml",
    base: "#{Dir.home}/.rings/",
    db: "#{Dir.home}/.rings/database.db"
  }.freeze
end
