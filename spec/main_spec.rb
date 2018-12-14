require "spec_helper"
RSpec.describe Tapiron::Main do
  it "can start server" do
    router = {}
    Tapiron::Main.prepare({}).cook()
    expect(last_response).to be nil
  end
end
