# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  include RackSessionsFix
  respond_to :json

  private
    def respond_with(current_user, _opts = {})
      if resource.persisted?
        render json: {
        status: { code: 200, message: 'Signed up successfully.' },
        data: UserSerializer.new(current_user).serializable_hash[:data][:attributes]
      } 
      else
        render json: { 
        status: { code: 422, message: 'User could not be created.'},
        message:"User could not be created. #{current_user.errors.full_messages.to_sentence}"
      }
      end
    end
end
