class LoansController < ApplicationController
  before_action :set_loan, only: %i[ show edit update destroy ]
  before_action :client_or_admin, only: :show

  def show
  end

  def create
    @loan = Loan.new(loan_params)
    User.all.each do |user|
      if @loan.client_email == user.email
        @loan.user_id = user.id
        @loan.save
      end
    end

    respond_to do |format|
      if @loan.save
        format.html { redirect_to admin_loans_path, notice: "Loan was successfully created." }
        format.json { render :show, status: :created, location: @loan }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @loan.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    User.all.each do |user|
      if @loan.client_email == user.email
        @loan.user_id = user.id
        @loan.save
      end
    end

    respond_to do |format|
      if @loan.update(loan_params)
        format.html { redirect_to admin_loans_path, notice: "Loan was successfully updated." }
        format.json { render :show, status: :ok, location: @loan }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @loan.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @loan.destroy

    respond_to do |format|
      format.html { redirect_to admin_loans_path, notice: "Loan was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def client_or_admin
      unless current_user && ( current_user.admin || current_user == @loan.user )
        redirect_back fallback_location: root_path
        flash[:notice] = "Sorry, you don't have the permissions to view that page.  If you think you have gotten this message in error, please contact the site administrator at admin@LinchpinRealty.com."
      end
    end

    def set_loan
      @loan = Loan.find(params[:id])
    end


    def loan_params
      params.require(:loan).permit(
        :first_payment, 
        :principal, 
        :interest_rate, 
        :term_months, 
        :active, 
        :user_id, 
        :admin_notes,
        :client_email,
        :client_last_name,
        :program
      )
    end
end
