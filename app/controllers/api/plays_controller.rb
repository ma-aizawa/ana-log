class Api::PlaysController < Api::ApplicationController
  def create
    @play = Play.create!(play_params)
  rescue ActiveRecord::RecordInvalid
    render :error
  end

  private
  def play_params
    extracted_params = params.require(:play).permit(:date, :game_id, :user_id)
    if params[:play][:user_id].to_i != current_user.id
      raise ActiveRecord::RecordInvalid
    end
    extracted_params
  end
end
