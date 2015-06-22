class AddingAGroup

  def initialize(user)
    @user = user
  end

  def authorized?
    true
  end

  def call(*args)
    raise "Operation not permitted" unless authorized?
    Group.create(*args)
  end

end
