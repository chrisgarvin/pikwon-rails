class OptionsController < ApplicationController
  before_action :require_user

  @posts = Post.all

  def index
  end

  def show
    @options = Option.all.order('option_picks DESC')

    @skipped = []
    Post.all.each do |post|
      @skipped << {first: post.options.first.option_text, last: post.options.last.option_text,
         skips: Pick.where("skip"=>true).where("post_id"=>post.id).count}
         @skipped.sort_by! { |x| x[:skips] }.reverse!
    end
  end

  def new

  end

  def create

  end

end
