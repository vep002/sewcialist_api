class ProjectSerializer < ActiveModel::Serializer
    attributes :id, :title, :description, :status, :user_id
    
    has_many :steps
    has_many :materials
end