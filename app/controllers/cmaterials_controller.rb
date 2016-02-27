class CmaterialsController < ApplicationController
  before_action :set_cmaterial, only: [:show, :edit, :update, :destroy]

  # GET /cmaterials
  # GET /cmaterials.json
  def index
    @cmaterials = Cmaterial.all
  end

  # GET /cmaterials/1
  # GET /cmaterials/1.json
  def show
  end

  # GET /cmaterials/new
  def new
    @cmaterial = Cmaterial.new
    @cmaterial.course_id = params[:course_id];
  end

  # GET /cmaterials/1/edit
  def edit
  end

  # POST /cmaterials
  # POST /cmaterials.json
  def create
    @cmaterial = Cmaterial.new(cmaterial_params)

    respond_to do |format|
      if @cmaterial.save
        format.html { redirect_to current_user, notice: 'Course material was successfully created.' }
        format.json { render :show, status: :created, location: @cmaterial }
      else
        format.html { render :new }
        format.json { render json: @cmaterial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cmaterials/1
  # PATCH/PUT /cmaterials/1.json
  def update
    respond_to do |format|
      if @cmaterial.update(cmaterial_params)
        format.html { redirect_to @cmaterial, notice: 'Cmaterial was successfully updated.' }
        format.json { render :show, status: :ok, location: @cmaterial }
      else
        format.html { render :edit }
        format.json { render json: @cmaterial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cmaterials/1
  # DELETE /cmaterials/1.json
  def destroy
    @cmaterial.destroy
    respond_to do |format|
      format.html { redirect_to cmaterials_url, notice: 'Cmaterial was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cmaterial
      @cmaterial = Cmaterial.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cmaterial_params
      params.require(:cmaterial).permit(:content, :course_id)
    end
end
