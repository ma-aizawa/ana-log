class Web::ReviewsController < Web::ApplicationController
  def index

  end

  def add
    @review = Review.new
  end
end
