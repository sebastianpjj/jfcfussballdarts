class CompetitionsController < ApplicationController

  def show
    @competition = Competition.find_by(slug: params[:slug])

    unless @competition.present?
      redirect_to("http://www.eintracht-feldberg.de/", allow_other_host: true)
      return
    end

    render "/competitions/#{@competition.slug}"
  end

end
