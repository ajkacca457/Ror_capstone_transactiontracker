module ApplicationHelper
  def showbtns
    return unless user_signed_in?

    link_to 'log out', destroy_user_session_path, method: :delete,
                                                  class: 'mr-3 bg-danger
                                                      text-white px-2 py-1
                                                      radius w-100 d-md-inline
                                                      d-block'
  end
end
