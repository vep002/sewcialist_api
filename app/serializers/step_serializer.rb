class StepSerializer < ActiveModel::Serializer
  attributes :id, :description, :start_date, :end_date, :completed, :project_id

end