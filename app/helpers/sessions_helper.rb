module SessionsHelper
  
  #現在ログインしているユーザーを返す（ユーザーがログイン中の場合のみ）
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])  
  end
  
  #ユーザーがログインしていればtrue、その他ならfalseを返す
  def logged_in?
    !!current_user
  end
  
  def store_location
    session[:fowording_url] = request.url if request.get?
  end
end