class OptionsController < ApplicationController
  before_action :require_user

  @posts = Post.all

  def index
  end

  def show
  end

  def new

    @option = Option.crate(:option_text => :option_text_one)

  end

  def create

  end

end
