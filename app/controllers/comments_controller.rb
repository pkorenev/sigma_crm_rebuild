class CommentsController < NestedResourcesController
  def resource_class
    Comment
  end

  def init_new_instance
    super
    @resource.comment_author = current_user
  end
end

