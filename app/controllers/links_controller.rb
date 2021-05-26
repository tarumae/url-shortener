class LinksController < ApplicationController

  def index
    @links = Link.where(user: current_user)
  end

  def show
    @link = Link.find_by_short_link(params[:id])
    @link.update(counter: @link.counter += 1 )
    redirect_to @link.long_link
  end
end
