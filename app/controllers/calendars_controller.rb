class CalendarsController < ApplicationController
  def index
    @calendars = Calendar.all
  end

  def new
    @calendar = Calendar.new
  end
#Defining CRUD code in the Calendars controller.
#The controller is responsible for accepting requests from the user, gathering 
#the necessary data from the model, and rendering the correct view.
#In rails the controller is a Ruby class with Methods that correspond to 
#various actions in the application. 
  def create
    @calendar = Calendar.create calendar_params
    if @calendar.save
      flash[:notice] = 'Calendar was successfully created'
      redirect_to root_path
    else
      flash[:error] = 'Calendar was NOT saved'
      render :new
    end
  end
  #def create allows for the creation of calendar data and displays a message depending
  #on whether the data was saved or not.

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
    #Show,edit,update and destroy allow for the showing, editing, updating and deletion
    #of data input into the calendar form. Parameters are identified by the assigned
    #id in the database.
  end
#The private before the def calendar_params calls for strong parameters which is a
#precaution that helps to prevent malicious attackers from compromising data.
  private
  def calendar_params
    params.require(:calendar).permit(
      :name,
      :title
    )
  end
end
