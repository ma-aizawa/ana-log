class Web::PlaysController < Web::ApplicationController
  def index
    @play_history = Play.order('date desc, id desc')
    @play = Play.new
    @games = Game.all
  end
end

