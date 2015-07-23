class DiscussionEntrySerializer < ActiveModel::Serializer

  attributes :id, :discussion_id, :body
  has_one :author,  serializer: UserSerializer

end
