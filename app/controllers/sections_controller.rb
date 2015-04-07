class SectionsController < ApplicationController
	before_action :set_section, only: [:show, :edit, :update, :destroy]

	# GET /sections
	# GET /sections.json
	def index
		@sections = Section.all
		# @subject = @section.subject
	end

	# GET /sections/1
	# GET /sections/1.json
	def show
	end

	# GET /sections/new
	def new
		@section = Section.new
		@subject = @section.subject
	end

	# GET /sections/1/edit
	def edit
	end

	# POST /sections
	# POST /sections.json
	def create
		@section = Section.new(section_params)
		@subject_id = params[:subject_id]
		respond_to do |format|
			if @section.save
				format.html { redirect_to sections_courses_path, notice: 'Section was successfully created.' }
				format.json { render :show, status: :created, location: @section }
			else
				format.html { render :new }
				format.json { render json: @section.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /sections/1
	# PATCH/PUT /sections/1.json
	def update
		respond_to do |format|
			if @section.update(section_params)
				format.html { redirect_to @section, notice: 'Section was successfully updated.' }
				format.json { render :show, status: :ok, location: @section }
			else
				format.html { render :edit }
				format.json { render json: @section.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /sections/1
	# DELETE /sections/1.json
	def destroy
		@section.destroy
		respond_to do |format|
			format.html { redirect_to sections_url, notice: 'Section was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private
		# Use callbacks to share common setup or constraints between actions.
		def set_section
			@section = Section.find(params[:id])
			@subject = @section.subject
		end

		def set_subject
			@subject = Subject.find(params[:subject_id])
		end

		# Never trust parameters from the scary internet, only allow the white list through.
		def section_params
			params.require(:section).permit(:name, :department, :number, :subject_id, :subjects_attributes =>[:id, :name, :short_name])
		end
end
