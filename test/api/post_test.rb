require "test_helper"

class APITest < ActiveSupport::TestCase
  include Rack::Test::Methods

  def app
    Acme::Post
  end

  describe "POST /api/spline" do
    before do
      # setup block
    end

    [true, false].each do |reticulated|
      it "POST #{reticulated ? 'reticulated' : 'unreticulated' } spline" do
        post '/api/spline', { 'reticulated' => reticulated }, 'Content-Type' => 'application/json'
        last_response.status.must_equal 201
        expected = {'reticulated' => reticulated }.to_json
        last_response.body.must_equal expected
      end
    end
  end


end


