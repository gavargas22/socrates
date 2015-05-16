class CoursesController < ApplicationController
  include SessionsHelper
  before_action :set_course, only: [:show, :edit, :update, :destroy, :sign_up, :enroll, :course]

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


  # GET /courses/1/students/1
  def sign_up
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)
    # puts params
    # @course.section_id = params[:section_id]

    #Automatically set slug of the course upon creation.
    @course.slug = @course.crn


    respond_to do |format|
      if @course.save
        format.html { redirect_to course_path(id: @course), notice: 'Course was successfully created.' }
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
      format.html { redirect_to courses_path, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # ============================== Subscription Functions ======================================

  def enroll
    # Error if password is blank
    # @course.errors.add(:password, "can not be blank") if params[:password].empty?

    # Authenticate with password input and return the course object, otherwise return false.
    authenticated = @course.authenticate(params[:course][:password])
    @course.errors.add(:password, "is incorrect") if !authenticated

    # Fetch current student this will probably be used later on.
    student = Student.find(current_user.id)

    # Check if the user was enrolled previously
    student_previously_enrolled = current_user.subscribed_courses.include?(@course)

    respond_to do |format|
      if authenticated && !student_previously_enrolled
        current_user.subscribe(@course)
        format.html { redirect_to course_path(id: @course), notice: "You were successfully enrolled in the course!"}
      elsif !authenticated
        format.html { redirect_to course_path(id: @course), notice: "The password does not match the record!"}
      end
      # if @course.errors.empty? && @course.students << student # Reload if errors exist
      #   current_user.subscribe(@course)
        # format.html { redirect_to @course, notice: "Welcome to the course!"}
      # elsif student_previously_enrolled
      #   format.html { redirect_to @course, notice: "You are already registered to this course."}
      # end
    end

  end

  def leave_course
    # respond_to do |format|
    # 	# if current_user.subscribed_courses.include(@course.id)
    # 	current_user.unsubscribe(@course)
    # 	format.html { redirect_to courses_path, notice: "You have left the course."}
    # end
  end

  # ===================================================================================================

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:crn, :description, :password, :password_confirmation, :section_id, :faculty_id, :course_avatar, :slug, :title)
    end
end
