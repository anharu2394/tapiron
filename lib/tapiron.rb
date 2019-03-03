# frozen_string_literal: true

require 'tapiron/version'

module Tapiron
  class Error < StandardError; end
  require 'tapiron/main'
  require 'tapiron/router'
end
