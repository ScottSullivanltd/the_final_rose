class ContestantsController < ApplicationController
  def index
    @contestants = Bachelorette.find(params[:bachelorette_id]).contestants
  end
end
