module SessionsHelper
  # 登入指定的用户
  def sign_in(user)
    session[:user_id] = user.id
  end

  # 在持久会话中记住用户
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  # 返回当前登录的用户（如果有的话）
  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        sign_in user
        @current_user = user
      end
    end
  end
  # 如果用户已登录，返回 true，否则返回 false
  def signed_in?
    !current_user.nil?
  end

  def sign_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end

  def current_user?(user)
    user == current_user
  end

  # 忘记持久会话
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end
end
