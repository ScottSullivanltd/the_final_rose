class ContestantsController < ApplicationController
  def index
    @contestants = Bachelorette.find(params[:bachelorette_id]).contestants
  end

  def show
    @contestant = Contestant.find(params[:id])
  end
end
