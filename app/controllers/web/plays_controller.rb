class Web::PlaysController < Web::ApplicationController
  before_action :current_user

  def index
    @play_history = Play.where(user_id: @current_user.id).order('date desc, id desc')
    @play = Play.new
    @games = Game.all
  end

end

