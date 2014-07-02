class PlayersController < ApplicationController

  def index
    @players = Player.order(:name)
  end

end
