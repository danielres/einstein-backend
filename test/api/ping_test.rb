require "test_helper"

class APITest < ActiveSupport::TestCase
  include Rack::Test::Methods

  def app
    Acme::Ping
  end

  describe "GET /api/ping" do
    before do
      # setup block
    end
    describe "without params" do
      let(:expected){ {"ping"=>"pong"} }
      it "returns pong" do
        get "/api/ping"
        last_response.must_be :ok?
        JSON.parse(last_response.body).must_equal expected
      end
    end
    describe "with param 'pong' set" do
      let(:expected){ {"ping"=>"aaa"} }
      it "returns the param value" do
        get "/api/ping?pong=aaa"
        last_response.must_be :ok?
        JSON.parse(last_response.body).must_equal expected
      end
    end
  end


end


