class CalendarsController < ApplicationController
  def index
    @calendars = Calendar.all
  end

  def new
    @calendar = Calendar.new
  end

  def create
    @calendar = Calendar.create calendar_params
    redirect_to root_path
  end

  def show
    @calendar = Calendar.find params[:id]
  end

  def edit
    @calendars = Calendar.all
    @calendar = Calendar.find params[:id]
  end

  def update
    @calendar = Calendar.find params[:id]
    @calendar.update_attributes calendar_params
    redirect_to root_path
  end

  def destroy
    @calendar = Calendar.find params[:id]
    @calendar.destroy
    redirect_to root_path
  end

  private
  def calendar_params
    params.require(:calendar).permit(
      :name,
      :title
    )
  end
end
