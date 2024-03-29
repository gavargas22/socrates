class ContestsController < ApplicationController
  include SessionsHelper

  helper_method :survey, :participant

  def new
    @attempt = survey.attempts.new
    # build a number of possible answers equal to the number of options
    survey.questions.size.times { @attempt.answers.build }
  end

  # create a new attempt in this survey
  # an attempt needs to have a participant assigned
  def create
    @attempt = survey.attempts.new(params[:attempt])
    # ensure that current user is assigned with this attempt
    @attempt.participant = participant
    if @attempt.valid? and @attempt.save
      redirect_to survey_path
    else
      render :action => :new
    end
  end

  def participant
    @participant ||= current_user
  end

  def survey
    #@survey ||= Survey::Survey.active.first
  end

end
