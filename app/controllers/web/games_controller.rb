class Web::GamesController < Web::ApplicationController
  before_action :current_user

  def index
    @games = Game.all
  end

  def add
    @game = Game.new
  end

  def create
    Game.create!(game_params)
    redirect_to game_list_path
  rescue ActiveRecord::RecordInvalid
    @game = Game.new(game_params)
    render :add
  end

  private
  def game_params
    params.require(:game).permit(:name, :kana, :kana, :kana, :description, :image, :image_cache)
  end
end
