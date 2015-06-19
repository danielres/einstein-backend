require "test_helper"

describe AddingAGroup do
  let(:user) { User.new(username: 'a', password: '12345678', email: 'test@test.com') }
  let(:subject) { AddingAGroup.new(user) }

  describe "api" do
    it "responds to authorized?" do
      subject.respond_to?(:authorized?).must_equal true
    end
  end

  describe "execution" do


    it "creates a group" do

    end

  end
end
