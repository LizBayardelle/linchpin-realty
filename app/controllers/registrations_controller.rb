class RegistrationsController < Devise::RegistrationsController
  invisible_captcha only: [:create], honeypot: :subtitle

  def create
    super
    # UserMailer.new_user(self).deliver_now
    rescue Exception => e
    flash[:notice] = e.message
  end

  protected

  def update_resource(resource, params)
    # Require current password if user is trying to change password.
    return super if params["password"]&.present?

    # Allows user to update registration information without password.
    resource.update_without_password(params.except("current_password"))
  end

  def after_update_path_for(resource)
    flash[:notice] = "Successfully updated!"
    if current_user.admin
      admin_clients_path
    else
      root_path
    end
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
      :current_client,
      :team,
      :team_id,
      :client_id,
      user_ids: []
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
      :current_client,
      :team,
      :team_id,
      :client_id,
      user_ids: []
    )
  end
end
