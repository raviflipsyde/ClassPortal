class TeachesController < ApplicationController
  before_action :set_teach, only: [:show, :edit, :update, :destroy]

  # GET /teaches
  # GET /teaches.json
  def index
    @teaches = Teach.all
  end

  # GET /teaches/1
  # GET /teaches/1.json
  def show
  end

  # GET /teaches/new
  def new
    @teach = Teach.new
  end

  # GET /teaches/new/:id
  def newteachescourse
    @teach = Teach.new
    @teach.course_id= params[:c_id]

    @instr = Instructor.all

    render :action => :new
  end


  # GET /teaches/1/edit
  def edit
  end

  # POST /teaches
  # POST /teaches.json
  def create
    @teach = Teach.new(teach_params)

    teach1 = Teach.where("user_id = ? AND course_id = ?", @teach.user_id, @teach.course_id)
    if(teach1.size < 1)
      respond_to do |format|
        if @teach.save
          format.html { redirect_to courses_path, notice: 'Teach was successfully created.' }
          format.json { render :show, status: :created, location: @teach }
        else
          format.html { render :new }
          format.json { render json: @teach.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html {  redirect_to courses_path , notice: 'Instructor already teaches this course.' }
      end
    end

  end

  # PATCH/PUT /teaches/1
  # PATCH/PUT /teaches/1.json
  def update
    respond_to do |format|
      if @teach.update(teach_params)
        format.html { redirect_to @teach, notice: 'Teach was successfully updated.' }
        format.json { render :show, status: :ok, location: @teach }
      else
        format.html { render :edit }
        format.json { render json: @teach.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teaches/1
  # DELETE /teaches/1.json
  def destroy
    @teach.destroy
    respond_to do |format|
      format.html { redirect_to teaches_url, notice: 'Teach was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  #POST /teaches/add/courseid/instructorid
  def addnewinstructor
    i_id = params[:i_id]
    c_id = params[:c_id]
    @teach = Teach.where("user_id = ? AND course_id = ?", i_id, c_id)
    if(@teach.size<1)
      @teach = Teach.new
      @teach.user_id= i_id
      @teach.course_id= c_id

      respond_to do |format|
        if @teach.save
          format.html { redirect_to @teach, notice: 'Teach was successfully created.' }
          format.json { render :show, status: :created, location: @teach }
        else
          format.html { render :new }
          format.json { render json: @teach.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html {  redirect_to :back , notice: 'Instructor already teaches this course.' }
      end
    end

  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_teach
    @teach = Teach.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def teach_params
    params.require(:teach).permit(:request, :user_id, :course_id)
  end
end
