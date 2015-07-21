class AddingADiscussion

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

    def execute(params, success: ->{}, failure: ->{})
      discussion = Discussion.new(params)
      discussion.author = @user
      if discussion.save
        success.call(discussion)
      else
        failure.call(discussion)
      end
    end

end
