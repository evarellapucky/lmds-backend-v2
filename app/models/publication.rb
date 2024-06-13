class Publication < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  validates :title, presence: true
  validates :description, presence: true
  validates :to_display, inclusion: { in: [true, false] }
end
