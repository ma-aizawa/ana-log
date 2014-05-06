class Web::ReviewsController < Web::ApplicationController
  def index
    @reviews = Review.all
  end

  def add
    @games = Game.all
    @review = Review.new
  end

  def create
    Review.create!(review_params)
    redirect_to action: :index
  rescue ActiveRecord::RecordInvalid
    @games = Game.all
    @review = Review.new(review_params)
    render :add
  end

  private
  def review_params
    params.require(:review).permit(:game_id, :body)
  end
end
