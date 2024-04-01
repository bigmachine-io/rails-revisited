class MediaTypesController < ApplicationController
  before_action :set_media_type, only: %i[ show edit update destroy ]

  # GET /media_types or /media_types.json
  def index
    @media_types = MediaType.all
  end

  # GET /media_types/1 or /media_types/1.json
  def show
  end

  # GET /media_types/new
  def new
    @media_type = MediaType.new
  end

  # GET /media_types/1/edit
  def edit
  end

  # POST /media_types or /media_types.json
  def create
    @media_type = MediaType.new(media_type_params)

    respond_to do |format|
      if @media_type.save
        format.html { redirect_to media_type_url(@media_type), notice: "Media type was successfully created." }
        format.json { render :show, status: :created, location: @media_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @media_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /media_types/1 or /media_types/1.json
  def update
    respond_to do |format|
      if @media_type.update(media_type_params)
        format.html { redirect_to media_type_url(@media_type), notice: "Media type was successfully updated." }
        format.json { render :show, status: :ok, location: @media_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @media_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /media_types/1 or /media_types/1.json
  def destroy
    @media_type.destroy!

    respond_to do |format|
      format.html { redirect_to media_types_url, notice: "Media type was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_media_type
      @media_type = MediaType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def media_type_params
      params.require(:media_type).permit(:name)
    end
end
