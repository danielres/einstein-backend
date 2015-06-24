class AddingAGroup

  def initialize(user)
    @user = user
  end

  def authorized?
    true
  end

  def call(*args)
    raise ActionForbiddenError unless authorized?
    execute(*args)
  end


  private

    def execute(*args)
      @group = Group.new(*args)
      if @group.save
        @group
      else
        { errors: @group.errors }
      end
    end

end
