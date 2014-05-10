class Web::UsersController < Web::ApplicationController
  def login
    login_id = filter_login_id(params[:login_id])
    user = User.find_by_id(login_id)
    unless user
      user = User.create!(id: login_id)
    end
    session[:user_id] = user.id
    redirect_to play_history_path
  end

  def logout
    reset_session
    redirect_to play_history_path
  end

  private
  def filter_loing_id(login_id)
    # TODO unless login_id.to_i.to_s == login_id
    login_id.to_i
  end
end

