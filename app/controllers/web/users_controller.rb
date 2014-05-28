class Web::UsersController < Web::ApplicationController
  def login
    case params[:login_type]
    when 'login'
      user = User.find_by_user_id(params[:login_id])
      unless user && user.match_key?(params[:key_phrase])
        flash[:notice] = '入力したのが合ってないよ'
        redirect_to play_history_path and return
      end
      session[:user_id] = user.id
    when 'signup'
      user_id = params[:login_id]
      key_phrase = params[:key_phrase]
      user = User.create!(user_id: user_id, key_phrase: key_phrase)
      session[:user_id] = user.id
    end
    redirect_to play_history_path
  rescue ActiveRecord::RecordInvalid
    flash[:notice] = '入力パラメータが足りないとか'
    redirect_to play_history_path
  end

  def logout
    reset_session
    redirect_to play_history_path
  end
end

