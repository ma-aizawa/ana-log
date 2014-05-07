class Api::GamesController < Api::ApplicationController
  def search
    keyword = params[:keyword]
    unless keyword
      @games = []
      return
    end
    query = "#{keyword}%"
    @games = Game.where('name like ? or kana like ?', query, query)
  end
end
