class PicksController < ApplicationController
  def index
  end

  def new
  end

  def show
  end

  def update
  end
  def like
    @option = Option.find(params[:id].to_i)
    @option.option_picks +=1
    @option.save
    redirect_to "/"
  end
end
