class HomeController < ApplicationController
  def index
    @calendars = Calendar.all
  end
end
