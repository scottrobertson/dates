class DateToRemember < ActiveRecord::Base

  validates :title, presence: true
  validates :date, presence: true
  validates :category, presence: true

end
