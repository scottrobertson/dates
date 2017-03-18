class DateToRemember < ActiveRecord::Base

  validates :title, presence: true
  validates :date, presence: true
  validates :category, presence: true

  def self.categories
    ['Other', 'Birthday', 'Travel', 'Anniversary', 'Home', 'Work', 'Event'].sort
  end

end
