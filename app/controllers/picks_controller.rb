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

# check to see if current_user has already voted on particular post, only allow
# one vote on each post

    if current_user.picks.where(:option_id => @option.id).count == 0
      @pick = Pick.create(:user_id => current_user.id, :option_id => @option.id,
      :post_id => params[:post].to_i, :skip => params[:skip])
      if @pick.skip == false
        @option.option_picks +=1
        @option.save
        sleep 1.2
        redirect_to "/"
    else

      redirect_to(posts_path)
    end
  end
end

end
