class PicksController < ApplicationController
  before_action :require_user
  
  def index
  end

  def new
    @pick = Pick.new
  end

  def show
  end

  def update
  end
  def like
    @option = Option.find(params[:id].to_i)
    @pick = Pick.create(:user_id => current_user.id, :option_id => @option.id,
    :post_id => params[:post].to_i)
    @option.option_picks +=1
    @option.save
    redirect_to "/"
  end

end
