class Material < ApplicationRecord
  belongs_to :user
  has_many :project_materials
  has_many :projects, through: :project_materials
end
