class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :new_subscriber
  before_action :set_variables
  invisible_captcha only: [:new_subscriber], honeypot: :subtitle

  def set_variables
    @loans = Loan.where(active: true)
    @documents = Document.all.order(created_at: :desc).limit(10)
    @clients = []
    User.all.each do |u|
      if u.current_client
        @clients << u
      elsif u.documents.count != 0
        @clients << u
      elsif u.loans.count != 0
        @clients << u
      end
    end
    @clients.sort_by{|e| e[:last_first]}
  end

  def new_subscriber
    @new_subscriber = Subscriber.new
  end

  def admin_only
    unless current_user && current_user.admin
      redirect_back fallback_location: root_path
      flash[:notice] = "Sorry, you need to be an administrator to do that!"
    end
  end


  def team_only
    unless current_user && current_user.team
      redirect_back fallback_location: root_path
      flash[:notice] = "Sorry, you don't have access to that. Please contact an admin if you think this could be in error."
    end
  end
end
