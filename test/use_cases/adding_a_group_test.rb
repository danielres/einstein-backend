require "test_helper"

describe AddingAGroup do
  let(:described_class) { AddingAGroup }
  let(:user) { User.new(username: 'a', password: '12345678', email: 'test@test.com') }
  let(:subject) { AddingAGroup.new(user) }


  describe "methods" do
    it "responds to #authorized?" do
      subject.must_respond_to :authorized?
    end
  end


  describe "execution" do
    it "triggers Group#create" do
      @FakeGroup = MiniTest::Mock.new
      @FakeGroup.expect(:create, _)
      described_class.stub_const(:Group, @FakeGroup) do
        subject.call
      end
      @FakeGroup.verify.must_equal true
    end
  end


end
