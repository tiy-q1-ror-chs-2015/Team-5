class Task < ActiveRecord::Base
  validates :date, presence: true
  validates :title, presence: true
  validates :misc, presence: true
  validates :completed, presence: true
  belongs_to :calendar
end
