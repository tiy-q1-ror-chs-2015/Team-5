class Calendar < ActiveRecord::Base
  validates :name, presence: true
  validates :title, presence: true
  has_many :tasks, dependent: :destroy
end
