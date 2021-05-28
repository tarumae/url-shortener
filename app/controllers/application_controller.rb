# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def not_found
    raise ActiveRecord::RecordNotFound
  end

  rescue_from ActiveRecord::RecordNotFound do
    flash[:alert] = 'This link does not exist anymore.'
    redirect_to root_path
  end

  protected

  def after_sign_in_path_for(*)
    links_path
  end
end
