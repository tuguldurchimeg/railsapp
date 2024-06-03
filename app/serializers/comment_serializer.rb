class CommentSerializer
  include FastJsonapi::ObjectSerializer
  attributes :commenter, :body
  belongs_to :articles
end
