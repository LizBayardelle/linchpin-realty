class AdminController < ApplicationController
  before_action :admin_only
  
  def dashboard
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

  def loans
    @loans = Loan.all.order("first_payment DESC")
    @current_loans = Loan.where(active: true).order("first_payment DESC")
    @past_loans = Loan.where(active: false).order("first_payment DESC")
  end

  def blogs
  end

  def clients
    @clients = User.where(current_client: true)
  end

  def documents
    @documents = Document.all
    @clients = []
    User.all.each do |u|
      if u.documents.count != 0
        @clients << u
      end
    end
    @clients.sort_by{|e| e[:last_first]}
  end
end
