require 'test_helper'


class APITest::Protected < ActiveSupport::TestCase


    def app
      Sample::Protected
    end


  describe "GET /api/v1/protected/ping" do
    describe 'without authorization' do
      it 'does not pass (401)' do
        get '/api/v1/protected/ping'
        last_response.status.must_equal 401
        last_response.body.must_equal ''
      end
    end
    describe 'with incorrect authorization' do
      it 'does not pass (401)' do
        get '/api/v1/protected/ping', nil,
            'HTTP_AUTHORIZATION' => ActionController::HttpAuthentication::Basic.encode_credentials('foo', 'bar')
        last_response.status.must_equal 401
        last_response.body.must_equal ''
      end
    end
    describe 'with authorization' do
      it 'passes (200) and responds' do
        get '/api/v1/protected/ping', nil,
            'HTTP_AUTHORIZATION' => ActionController::HttpAuthentication::Basic.encode_credentials('username', 'password')
        last_response.status.must_equal 200
        last_response.body.must_equal({ ping: 'pong' }.to_json)
      end
    end
  end

end
