require 'rack'
class Tapiron::Main
  def initialize(router)
    @router = router
  end
  def self.prepare(router)
    self.new(router)
  end
  def cook
    Rack::Handler::WEBrick.run self
  end
  def call(env)
    req = Rack::Request.new(env)
    @router.routes.each do |path, res|
      if (req.path_info == path || req.path_info == path + "/")&& req.request_method == res[:request_method]
        return [200, {'Content-Type' => 'text/plain'}, [res[:response]]]
      end
    end
    [404, {'Content-Type' => 'text/plain'}, ['404 Not Found']]
  end
end
