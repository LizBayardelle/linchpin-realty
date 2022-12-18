class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
    @loans = Loan.where(user_id: @user.id)
    @documents = Document.where(user_id: @user.id)


    @contacts = Contact.where(archived: false).order('created_at DESC')
    @archived_contacts = Contact.where(archived: true).order('created_at DESC')
    @confirmed_clients = User.where(admin: false, archived: false, status_confirmed: true).order('created_at DESC')
    @unconfirmed_clients = User.where(admin: false, archived: false, status_confirmed: false).order('created_at DESC')
    @archived_clients = User.where(archived: true).order('created_at DESC')
    @comments = Comment.where(approved: false).order('created_at DESC')
    @values = Value.where(archived: false).order('created_at DESC')
    @archived_values = Value.where(archived: true).order('created_at DESC')
    @new_quicks = Quick.where(responded: false, archived: false).order('created_at DESC')
    @old_quicks = Quick.where(responded: true, archived: false).order('created_at DESC')
    @archived_quicks = Quick.where(archived: true).order('created_at DESC')
    @new_buyers = Buyer.where(archived: false).order('created_at DESC')
    @archived_buyers = Buyer.where(archived: true).order('created_at DESC')
  end

  def destroy
    user = User.find(params[:id])
    if current_user != user
      if user.destroy
        flash[:success] = "Successfully deleted"
      else
        flash[:error] = "Error"
      end
     redirect_to user_path(current_user)
    end
  end

  def confirm_client
      @client = User.find(params[:id])
      if @client.update_attributes(status_confirmed: true)
          redirect_back fallback_location: root_path
          flash[:notice] = "That message has been confirmed!"
      else
          redirect_to root_path
          flash[:warning] = "Oops! Something went wrong!"
      end
  end

  def unconfirm_client
      @client = User.find(params[:id])
      if @client.update_attributes(status_confirmed: false)
          redirect_back fallback_location: root_path
          flash[:notice] = "That message has been unconfirmed!"
      else
          redirect_to root_path
          flash[:warning] = "Oops! Something went wrong!"
      end
  end

  def archive_client
      @client = User.find(params[:id])
      if @client.update_attributes(archived: true)
          redirect_back fallback_location: root_path
          flash[:notice] = "That message has been archived!"
      else
          redirect_to root_path
          flash[:warning] = "Oops! Something went wrong!"
      end
  end

  def unarchive_client
      @client = User.find(params[:id])
      if @client.update_attributes(archived: false)
          redirect_back fallback_location: root_path
          flash[:notice] = "That message has been unarchived!"
      else
          redirect_to root_path
          flash[:warning] = "Oops! Something went wrong!"
      end
  end

  def client_read
      @client = User.find(params[:id])
      if @client.update_attributes(read: true)
          redirect_back fallback_location: root_path
          flash[:notice] = "That client has been marked read!"
      else
          redirect_to root_path
          flash[:warning] = "Oops! Something went wrong!"
      end
  end

  def client_unread
      @client = User.find(params[:id])
      if @client.update_attributes(read: false)
          redirect_back fallback_location: root_path
          flash[:notice] = "That client has been marked unread!"
      else
          redirect_to root_path
          flash[:warning] = "Oops! Something went wrong!"
      end
  end

  def subscribe_to_blog
    @user = current_user
    if @user.update_attributes(blog_emails: true)
        redirect_back fallback_location: root_path
        flash[:notice] = "You'll be the first to know about any new information!"
    else
        redirect_to root_path
        flash[:warning] = "Oops! Something went wrong!"
    end
  end

end
