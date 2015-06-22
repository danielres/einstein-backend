require "test_helper"

class APITest::PostTest < ActiveSupport::TestCase

    def app
      Sample::Post
    end

    describe "POST /api/v1/spline" do
      before do
        # setup block
      end

      [true, false].each do |reticulated|
        it "POST #{reticulated ? 'reticulated' : 'unreticulated' } spline" do
          post '/api/v1/spline', { reticulated: reticulated }, 'Content-Type' => 'application/json'
          last_response.status.must_equal 201
          expected = {'reticulated' => reticulated }.to_json
          last_response.body.must_equal expected
        end
      end
    end

  end
