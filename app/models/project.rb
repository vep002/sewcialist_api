class Project < ApplicationRecord
  belongs_to :user
  has_many :steps
  has_many :project_materials
  has_many :materials, through: :project_materials
  has_many :photos

  validates :title, presence: true, length: { maximum: 100 }
  validates :description, presence: true, length: { maximum: 500 }
  validates :status, presence: true, inclusion: { in: [0, 1, 2] } # 0 = not started, 1 = in progress, 2 = completed
end
