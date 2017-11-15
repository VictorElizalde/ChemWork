class Report < ApplicationRecord
	belongs_to :user
	belongs_to :assignment
	serialize :shared_with, Array
	validates :lab_phase, presence: true
end
