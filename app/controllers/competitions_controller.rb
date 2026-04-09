class CompetitionsController < ApplicationController

  def show
    if params[:slug] == 'current'
      @competition = Competition.find_by(is_current: true)
    else
      @competition = Competition.find_by(slug: params[:slug])
    end
    @training_sessions = @competition.training_sessions
  end
end