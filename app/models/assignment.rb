class Assignment < ApplicationRecord
  belongs_to :group
  has_many :reports
  validates :name, presence: true
end
