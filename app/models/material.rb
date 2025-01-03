class Material < ApplicationRecord
  belongs_to :user
  has_many :project_materials, dependent: :destroy
  has_many :projects, through: :project_materials
  has_one :photo, as: :imageable, dependent: :destroy
end
