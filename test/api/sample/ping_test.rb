require "test_helper"

class APITest::Ping < ActiveSupport::TestCase

    def app
      Sample::Ping
    end

    describe "GET /api/v1/ping" do
      before do
        # setup block
      end
      describe "without params" do
        let(:expected){ {"ping"=>"pong"} }
        it "returns pong" do
          get "/api/v1/ping"
          last_response.must_be :ok?
          JSON.parse(last_response.body).must_equal expected
        end
      end
      describe "with param 'pong' set" do
        let(:expected){ {"ping"=>"aaa"} }
        it "returns the param value" do
          get "/api/v1/ping?pong=aaa"
          last_response.must_be :ok?
          JSON.parse(last_response.body).must_equal expected
        end
      end
    end

end


