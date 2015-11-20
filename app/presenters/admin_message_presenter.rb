class AdminMessagePresenter < BasePresenter
  presents :admin_message

  def title
    @title ||= admin_message.title
  end

  def content
    @content ||= h.raw admin_message.content
  end
end