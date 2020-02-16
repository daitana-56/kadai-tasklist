module SessionsHelper
  #ログインユーザ情報
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  #ログイン確認
  def logged_in?
    !!current_user
  end
end
