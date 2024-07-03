class Project < ApplicationRecord
  belongs_to :user
  has_many :steps
  has_many :project_materials
  has_many :materials, through: :project_materials
  has_many :photos
end
