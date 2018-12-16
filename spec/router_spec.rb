require "spec_helper"
RSpec.describe Tapiron::Router do
  it "can add get route" do
    router = Tapiron::Router.new()
    hello_world = -> {
      "Hello World"
    }

    router.get('/', hello_world)
    expect(router.routes['/']).to eq({ request_method: "GET", response: "Hello World"})
  end
end
