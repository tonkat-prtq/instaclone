module BlogsHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'confirm' || action_name == 'create'
      confirm_blogs_path
    elsif action_name == 'edit'
      confirm_blog_path
    end
  end

  def confirm_new_or_edit
    unless @blog.id?
      blogs_path # blogs_pathはメソッドでindexかcreateに移動先が別れる。メソッドの指定はconfirm_form_methodで指定する。
    else
      blog_path
    end
  end

  def confirm_form_method
    @blog.id ? 'patch' : 'post' # @blog.idが存在する(=true)のとき、httpメソッドがpatch, 存在しないときはpost
  end
end
