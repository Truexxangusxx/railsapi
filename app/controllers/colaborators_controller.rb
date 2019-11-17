class ColaboratorsController < ApplicationController
  before_action :set_colaborator, only: [:show, :update, :destroy]

  # GET /colaborators
  def index
    @colaborators = Colaborator.all

    render json: @colaborators
  end

  # GET /colaborators/1
  def show
    render json: @colaborator
  end

  # POST /colaborators
  def create
    @colaborator = Colaborator.new(colaborator_params)

    if @colaborator.save
      render json: @colaborator, status: :created, location: @colaborator
    else
      render json: @colaborator.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /colaborators/1
  def update
    if @colaborator.update(colaborator_params)
      render json: @colaborator
    else
      render json: @colaborator.errors, status: :unprocessable_entity
    end
  end

  # DELETE /colaborators/1
  def destroy
    @colaborator.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_colaborator
      @colaborator = Colaborator.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def colaborator_params
      params.require(:colaborator).permit(:name, :direccion)
    end
end
