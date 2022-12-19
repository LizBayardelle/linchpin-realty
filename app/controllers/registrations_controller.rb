class RegistrationsController < Devise::RegistrationsController
  invisible_captcha only: [:create], honeypot: :subtitle

  def create
    super
    # UserMailer.new_user(self).deliver_now
    rescue Exception => e
    flash[:notice] = e.message
  end

  private

  def sign_up_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation,
      :phone,
      :buyer,
      :seller,
      :blog_emails,
      :preferred_contact,
      :status_confirmed,
      :current_client
    )
  end

  def account_update_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation,
      :current_password,
      :phone,
      :buyer,
      :seller,
      :blog_emails,
      :preferred_contact,
      :status_confirmed,
      :current_client
    )
  end
end
