class MaterialsController < ApplicationController
    before_action :authenticate_user!

    def index
        materials = current_user.materials
        render json: materials, status: :ok
    end

    def create
        add_material_to_project
    end

    def update
        material = current_user.materials.find(params[:id])
        if material.update(material_params)
            render json: material, status: :ok
        else
            render json: { errors: material.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def destroy
        material = current_user.materials.find(params[:id])
        material.destroy
        render json: { message: 'Material deleted successfully' }, status: :ok
    end

    def add_material_to_project
        project = Project.find(params[:project_id])

        if params[:material_id]
            material = current_user.materials.find(params[:material_id])
            project.materials << material
        else
            new_material = current_user.materials.create(material_params)
            project.materials << new_material
        end
        render json: project.materials
    end

    private
    def material_params
        params.require(:material).permit(:name, :quantity, :user_id)
    end
    
end
