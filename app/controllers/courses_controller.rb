class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy, :sign_up, :enroll]

  # GET /courses
  # GET /courses.json
  def index
    if params[:section_id].nil?
      @courses = Course.all
    else
      @courses = Section.find_by_id(params[:section_id]).courses
    end
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  def enroll
    # Error if password is blank
    @course.errors.add(:password, "can not be blank") if params[:password].empty?

    # Error if password confirmation is not same as password
    @course.errors.add(:password_confirmation, "does not match password") if params[:password_confirmation] != params[:password]

    # Is password correct?
    authenticated = @course.authenticate(params[:password])
    @course.errors.add(:password, "is incorrect") if !authenticated

    puts "Authenticated #{authenticated}"
    puts @course.errors.count

    # Fetch current student
    student = Student.first #current_user

    respond_to do |format|
      if @course.errors.empty? && @course.students << student # Reload if errors exist
        format.html { redirect_to course_students_path(@course), notice: "Student was successfully registered"}
      else
        format.html { render :sign_up }
      end
    end
  end

  # GET /courses/1/students/1
  def sign_up
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)
    puts params
    @course.section_id = params[:section_id]

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
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
      params.require(:course).permit(:crn, :description, :password, :password_confirmation, :section_id, :faculty_id)
    end
end
