class DocumentsController < ApplicationController
  before_action :set_document, only: %i[ show edit update destroy ]
  before_action :admin_only, except: %i[ new index create destroy ]
  before_action :authenticate_user!, only: %i[ index new create destroy ]


  def index
    @documents = Document.where(user_id: current_user.id)
  end


  def new
    @document = Document.new
  end


  def create
    @document = Document.new(document_params)
    @document.update(user_id: current_user.id)

    @document.upload.attach(params[:document][:upload])

    respond_to do |format|
      if @document.save
        format.html { redirect_to documents_path, notice: "Thank you! Your document has been securely uploaded. You'll get a confirmation email when it is received by our team." }
        format.json { render :show, status: :created, location: @document }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @document.update(document_params)
        format.html { redirect_to admin_documents_path, notice: "Document was successfully updated." }
        format.json { render :show, status: :ok, location: @document }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @document.destroy

    respond_to do |format|
      format.html { redirect_to documents_path, notice: "Document was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  
  def mark_received
    @document = Document.find(params[:id])
    if @document.update_attributes(received: true)
        redirect_to admin_documents_path
        flash[:notice] = "That document has been marked recieved and the client has been notified."
    else
        redirect_to root_path
        flash[:warning] = "Oops! Something went wrong!"
    end
  end

  private


    def set_document
      @document = Document.find(params[:id])
    end


    def document_params
      params.require(:document).permit(
      :name,
      :notes,
      :user_id,
      :loan_id,
      :received,
      :upload
    )
    end
end
