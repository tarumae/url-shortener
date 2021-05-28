# frozen_string_literal: true

class LinksController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  def index
    @links = Link.where(user: current_user)
    @link = Link.new
  end

  def show
    @link = Link.find_by_short_link(params[:id]) || not_found
    @link.update(counter: @link.counter += 1)
    redirect_to @link.long_link
  end

  def create
    @link = Link.new(link_params)
    @link.short_link = SecureRandom.alphanumeric(8)
    @link.user = current_user
    if @link.save
      redirect_to links_path
    else
      check_errors(@link)
    end
  end

  def destroy
    @link = Link.find(params[:id])
    if @link.destroy
      flash[notice] = 'Link successfully destroyed!'
    else
      flash[alert] = 'Link could not be deleted. Perhaps try again?'
    end
    redirect_to links_path
  end

  private

  def link_params
    params.require(:link).permit(:long_link)
  end

  def check_errors(link)
    if link.errors.any?
      link.errors.each do |_attribute, message|
        flash[:alert] = message
      end
    else
      flash[:alert] = 'Looks like something unexpected happened. Perhaps try again?'
    end
    redirect_to links_path
  end
end
