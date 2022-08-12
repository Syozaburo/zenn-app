class TodoSerializer < ActiveModel::Serializer
  attributes :id, :title, :user_id, :username
  belongs_to :user

  def username
    # 名前をtodoと一緒に返す
    object.user.name
  end
end
