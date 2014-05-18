class Web::ReviewsController < Web::ApplicationController
  def add
    @play = Play.find(params[:play_id])
    @review = Review.find_by_play_id(params[:play_id]) || Review.new
  end

  def create
    if Review.exists?(play_id_from_params)
      review = Review.find_by_play_id(play_id_from_params[:play_id])
      review.update!(review_params)
    else
      Review.create!(review_params.merge(play_id_from_params))
    end
    redirect_to play_history_path
  rescue ActiveRecord::RecordInvalid
    @play = Play.find(params[:play_id])
    @review = Review.new(review_params)
    render :add
  end

  private
  def review_params
    params.require(:review).permit(:image, :body)
  end

  def play_id_from_params
    play_id = params.permit(:play_id)
    unless Play.exists?(id: play_id[:play_id])
      raise ActiveRecord::NotFound
    end
    play_id
  end
end
