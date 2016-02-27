class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all
    if (current_user.type == 'Admin')
      @is_admin = true
      @is_student = false
    elsif(current_user.type == 'Student')
      @is_admin = false
      @is_student = true
    else
      @is_admin = false
      @is_student = false
    end

      #search bar
      if params[:search]
        @courses = Course.search(params[:search]).order("number")
      else
        @courses = Course.all.order("number")
      end
    @instructor_course_map = {}

     @courses.each do |course|
       teach = Teach.find_by_course_id(course.id)
       if !teach.nil?
           name = Instructor.find(teach.user_id).name
           @instructor_course_map[course.id] = name
       end
     end
    # puts @instructor_course_map.to_s

  end

  # GET /courses/1
  # GET /courses/1.json
  def show

  @instr_string = ""
  teach = Teach.where(course_id: @course.id)

  if !teach.nil?
    teach.each do |t|
      @instr_string += Instructor.find(t.user_id).name + ", "
    end

  end

  @cmaterial = Cmaterial.where(course_id: @course.id)

  end

  # GET courses/1/coursecmaterials

  def showcoursecoursematerial

    @cmater = Cmaterial.where("course_id = ?",params[:id])
  end

  # GET /courses/new
  def new
    @course = Course.new
    @instructors = Instructor.all

  end

  # GET /courses/1/edit
  def edit
    @instructors = Instructor.all
  end

  # POST /courses[]
  # POST /courses.json
  def create
    @course = Course.new(course_params)
    puts("----------------------------------------")
    puts(params[:teaches][:user_id])
    puts("----------------------------------------")

    respond_to do |format|
      if @course.save
        @teaches = Teach.new

        @teaches.course_id = @course.id
        @teaches.user_id = params[:teaches][:user_id]
        @teaches.request = "Test"
        @teaches.save
        format.html { redirect_to courses_path, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        @instructors = Instructor.all
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:number, :title, :description, :startdate, :enddate, :status, :user_id)
    end

end
