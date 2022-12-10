class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  rescue_from ActiveRecord::RecordNotFound, :with => :render_404

  def render_404
    render :template => "/users/error", :status => 404
  end
end
