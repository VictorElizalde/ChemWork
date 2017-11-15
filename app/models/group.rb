class Group < ApplicationRecord
	has_and_belongs_to_many :users
	has_many :assignments
	validates :name, presence: true
	validates :schedule, presence: true
end
