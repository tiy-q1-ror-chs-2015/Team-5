class AddCalendarIdToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :calendar_id, :string
  end
end
