module ApplicationHelper
  def full_title page_title = ""
    base_title = t "helpers.application.rtsa"
    page_title ? (page_title + " | " + base_title) : base_title
    end
end
