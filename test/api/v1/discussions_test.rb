require "test_helper"
include Warden::Test::Helpers

class APITest::DiscussionsTest < ActiveSupport::TestCase

  def app
    Rails.application
  end


  before { set_token_authentication }


  describe "POST /api/v1/discussions" do
    describe "when required params are present" do
      it "returns an HTTP status 201 with the representation of the resource created" do
        post '/api/v1/discussions', { title: 'My discussion'}
        last_response.status.must_equal 201
        JSON.parse(last_response.body)['id'].must_be :present?
        JSON.parse(last_response.body)['author_id'].must_be :present?
        JSON.parse(last_response.body)['title'].must_equal 'My discussion'
      end
    end

    %w(title).each do |param|
      describe "when param '#{param}' is missing" do
        it "returns an HTTP status 400 with a list of errors" do
          post '/api/v1/discussions'
          last_response.status.must_equal 400
          JSON.parse(last_response.body)[param].must_be :present?
          last_response.body.must_include "can't be blank"
          last_response.body.must_include "is too short"
        end
      end
    end

  end


end
