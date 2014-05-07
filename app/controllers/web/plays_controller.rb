class Web::PlaysController < Web::ApplicationController
  def index
    @play_history = Play.all
  end

  def add
    @play = Play.new
    @games = Game.all
  end

  def create
    Play.create!(play_params)

    redirect_to action: :index
  rescue ActiveRecord::RecordInvalid
    @games = Game.all
    @play = Play.new(play_params)
    render :add
  end

  private
  def play_params
    params.require(:play).permit(:date, :game_id)
  end
end

