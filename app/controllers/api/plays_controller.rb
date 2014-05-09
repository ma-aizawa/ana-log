class Api::PlaysController < Api::ApplicationController
  def create
    @play = Play.create!(play_params)
  rescue ActiveRecord::RecordInvalid
    render :error
  end

  private
  def play_params
    params.require(:play).permit(:date, :game_id)
  end
end
