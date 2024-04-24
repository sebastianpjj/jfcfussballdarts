class CompetitionsController < ApplicationController

  def show
    @competition = Competition.find_by(slug: params[:slug])
    @training_sessions = @competition.training_sessions
  end
end