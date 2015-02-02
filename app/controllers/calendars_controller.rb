class CalendarsController < ApplicationController
  def self.is_date?(date_obj, calendar)
    return_string = "#{date_obj.mday} <br>"

    Task.all.each do |task|
      if task.date.strftime("%F") == date_obj.strftime("%F")
        return_string << "<a href='/calendars/#{task.calendar_id}/tasks/#{task.id}/edit'>
            #{task.title}
          </a>"
        return_string << "<a href='/calendars/#{task.calendar_id}/tasks/#{task.id}' data-method='delete' rel='nofollow'>
        
        <i class='glyphicon glyphicon-remove'></i></a><br>"
      end
    end
      return return_string
  end

  def index
    @calendars = Calendar.all
  end

  def new
    @calendar = Calendar.new
  end

  def create
    @calendar = Calendar.create calendar_params
    if @calendar.save
      flash[:notice] = 'Calendar was successfully created'
      redirect_to calendar_path(@calendar)
    else
      flash[:error] = 'Calendar was NOT saved'
      render :new
    end
  end

  def show
    @calendar = Calendar.find params[:id]
    @calendar_gem_params = {
      year: DateTime.now.year,
      month: DateTime.now.month,
      #previous_month_text: "<a href='#'>Prev. Month</a>", #used to add multi month support.  Feature not implemented
      #next_month_text: "<a href='#'>Next Month</a>"  #used to add multi month support.  Feature not implemented
    }

  end

  def edit
    @calendars = Calendar.all
    @calendar = Calendar.find params[:id]
  end

  def update
    @calendar = Calendar.find params[:id]
    @calendar.update_attributes calendar_params
    redirect_to calendar_path(@calendar)
  end

  def destroy
    @calendar = Calendar.find params[:id]
    @calendar.destroy
    redirect_to calendar_path(@calendar)
  end

  private
  def calendar_params
    params.require(:calendar).permit(
      :name,
      :title
    )
  end
end
