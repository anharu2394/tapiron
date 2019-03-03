# frozen_string_literal: true

require 'spec_helper'
RSpec.describe Tapiron do
  it 'has a version number' do
    expect(Tapiron::VERSION).not_to be nil
  end
end
