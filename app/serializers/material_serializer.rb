class MaterialSerializer < ActiveModel::Serializer
    attributes :id, :name, :description, :quantity, :user_id
  
  end