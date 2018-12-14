require 'rack'
require 'rack/builder'
class Tapiron::Main
  def initialize(router)
  end
  def self.prepare(router)
    self.new(router)
  end
  def cook
    main = Rack::Builder.new {
      use Rack::CommonLogger
      app = lambda { |env| [404, {'Content-Type' => 'text/plain'}, ['404']] }
      run app
    }.to_app
  end
  def call(env)
  end
end
