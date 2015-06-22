class AddingAGroup

  def initialize(user)
    @user = user
  end

  def authorized?
    true
  end

  def call
    Group.create
  end

end
