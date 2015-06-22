require "test_helper"

describe AddingAGroup do
  let(:described_class) { AddingAGroup }
  let(:user) { User.new(username: 'a', password: '12345678', email: 'test@test.com') }
  let(:subject) { described_class.new(user) }


  describe "methods" do
    it "responds to #authorized?" do
      subject.must_respond_to :authorized?
    end
  end


  describe "execution" do
    describe "when not authorized" do
      before do
        subject
          .stubs(:authorized?)
          .returns(false)
      end
      it "raises an error" do
        ->{ subject.call }.must_raise RuntimeError
      end
    end

    describe "when authorized" do
      before do
        subject
          .stubs(:authorized?)
          .returns(true)
      end
      it "triggers Group#create" do
        Group.expects(:create)
        subject.call
      end
    end
  end


end
