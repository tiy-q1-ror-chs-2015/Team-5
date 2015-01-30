class HomeController < ApplicationController
  def index
    @calendars = Calendar.all
    @tasks = Task.all
  end
end
