# frozen_string_literal: true

class Tapiron::Router
  attr_reader :routes
  def initialize
    @routes = {}
  end

  def get(path, func)
    @routes[path] = { request_method: 'GET', response: func[] }
  end
end
