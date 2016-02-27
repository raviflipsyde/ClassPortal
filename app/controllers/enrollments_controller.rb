class EnrollmentsController < ApplicationController
  before_action :set_enrollment, only: [:show, :edit, :update, :destroy]

  # GET /enrollments
  # GET /enrollments.json
  def index
    @enrollments = Enrollment.all
  end

  # GET /enrollments/1
  # GET /enrollments/1.json
  def show
  end

  # GET /enrollments/course/1
  # GET /enrollments/course/1.json
  def showcourse
    @enrollments = Enrollment.includes(:user).where("course_id = ?", params[:id]).order("user_id")
    @course_id = params[:id]

      puts "-----------------------------------------ENR START-------------------------------------"
    puts(@enrollments.size)
    @enrollments.each do |obj|
      puts(obj.inspect)
      obj.estatus=false if !obj.estatus?
    end
    puts "-----------------------------------------ENR END---------------------------------------"
  end

  def newenrollmenttocoure
    @enrollment = Enrollment.new
    @enrollment.course_id= params[:id]


    @students = Student.all

    render :action => :new
  end


  # GET /enrollments/new
  def new
    @enrollment = Enrollment.new

  end

  # GET /enrollments/1/edit
  def edit
    @students = Student.all

  end

  # POST /enrollments
  # POST /enrollments.json
  def create
    @enrollment = Enrollment.new(enrollment_params)
    respond_to do |format|
      if @enrollment.save
        format.html { redirect_to action: 'showcourse', id: @enrollment.course_id , notice:'Enrollment was successfully created.' }
        format.json { render :show, status: :created, location: @enrollment }
      else
        format.html { render :new }
        format.json { render json: @enrollment.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /enrollments/student/courseid
  def createstudentenrollment
    s_id = User.find(session[:user_id]).id
    c_id = params[:c_id]
    @enrollment = Enrollment.where("course_id = ? AND user_id = ?",c_id, s_id)
    if(@enrollment.size<1)
    @enrollment = Enrollment.new
    @enrollment.course_id = c_id
    @enrollment.user_id= s_id
    @enrollment.estatus= false
    respond_to do |format|
      if @enrollment.save
        format.html {  redirect_to :back , notice: 'Enrollment was successfully created.' }
        format.json { render :show, status: :created, location: @enrollment }
      else
        format.html { render :new }
        format.json { render json: @enrollment.errors, status: :unprocessable_entity }
      end
    end
    else
      respond_to do |format|
        format.html {  redirect_to :back , notice: 'You are already enrolled.' }
      end

    end

  end


  # PATCH/PUT /enrollments/1
  # PATCH/PUT /enrollments/1.json
  def update
    respond_to do |format|
      if @enrollment.update(enrollment_params)
        format.html { redirect_to action: 'showcourse', id: @enrollment.course_id , notice: 'Enrollment was successfully updated.' }
        format.json { render :show, status: :ok, location: @enrollment }
      else
        format.html { render :edit }
        format.json { render json: @enrollment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enrollments/1
  # DELETE /enrollments/1.json
  def destroy
    @enrollment.destroy
    respond_to do |format|
      format.html { redirect_to enrollments_url, notice: 'Enrollment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_enrollment
    @enrollment = Enrollment.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def enrollment_params
    params.require(:enrollment).permit(:grade, :user_id, :course_id, :estatus)
  end

  def enrollment_params_for_student
    params.require(:enrollment).permit(:user_id, :course_id)
  end
end
