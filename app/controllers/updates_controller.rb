class UpdatesController < ApplicationController
  before_action :set_update, only: %i[ show edit update destroy ]


  def index
    @updates = Update.where(display: true).order(date_published: :desc)
  end


  def show
  end


  def create
    @update = Update.new(update_params)

    respond_to do |format|
      if @update.save
        format.html { redirect_to update_url(updates_path), notice: "Update was successfully created." }
        format.json { render :show, status: :created, location: @update }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @update.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @update.update(update_params)
        format.html { redirect_to update_url(updates_path), notice: "Update was successfully updated." }
        format.json { render :show, status: :ok, location: @update }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @update.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @update.destroy

    respond_to do |format|
      format.html { redirect_to updates_path, notice: "Update was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_update
      @update = Update.find(params[:id])
    end


    def update_params
      params.require(:update).permit(
        :name,
        :source_name,
        :source_url,
        :resource_url,
        :category,
        :date_published,
        :display
      )
    end
end
