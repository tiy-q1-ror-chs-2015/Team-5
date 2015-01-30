class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.datetime :date
      t.string :title
      t.text :misc
      t.boolean :completed

      t.timestamps null: false
    end
  end
end
