class AddingAGroup

  def initialize(user)
    @user = user
  end

  def authorized?
    true
  end

  def call
    raise "Operation not permitted" unless authorized?
    Group.create
  end

end
