class HomeController < ApplicationController

  def index
    redirect_to("http://www.eintracht-feldberg.de/fussballdart", allow_other_host: true)
  end
end
