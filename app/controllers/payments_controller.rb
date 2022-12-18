class PaymentsController < ApplicationController
  before_action :set_payment, only: %i[ show edit update destroy ]


  def create
    @payment = Payment.new(payment_params)

    respond_to do |format|
      if @payment.save
        format.html { redirect_to loan_path(Loan.find(@payment.loan_id)), notice: "Payment was successfully created." }
        format.json { render :show, status: :created, location: @payment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @payment.update(payment_params)
        format.html { redirect_to loan_path(Loan.find(@payment.loan_id)), notice: "Payment was successfully updated." }
        format.json { render :show, status: :ok, location: @payment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @payment.destroy

    respond_to do |format|
      format.html { redirect_to loan_path(Loan.find(@payment.loan_id)), notice: "Payment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_payment
      @payment = Payment.find(params[:id])
    end


    def payment_params
      params.require(:payment).permit(
        :due_or_paid, 
        :date, 
        :loan_id, 
        :paid_by, 
        :amount
      )
    end
end
