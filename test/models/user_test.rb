require 'test_helper'

describe User do
  let(:user) { User.new(username: 'a', password: '12345678', email: 'test@test.com') }

  it "must be valid" do
    user.must_be :valid?
  end
end
