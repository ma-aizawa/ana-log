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

  def edit
    @game = Game.find(params[:id])
    render :add
  rescue ActiveRecord::RecordNotFound
    redirect_to game_list_path
  end

  def update
    @game = Game.find(game_id_param)
    @game.update!(game_params)

    flash[:notice] = '更新成功'
    redirect_to game_list_path
  rescue ActiveRecord::RecordInvalid
    flash.now[:notice] = '入力した値が間違っているよ'
    render :add
  end

  private
  def game_id_param
    params.require(:game).permit(:id)[:id]
  end

  def game_params
    params.require(:game).permit(:name, :kana, :description, :image, :image_cache)
  end
end
