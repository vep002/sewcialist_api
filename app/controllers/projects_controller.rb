class ProjectsController < ApplicationController
    before_action :authenticate_user!

    def index
        projects = current_user.projects.includes(:steps)
        render json: projects, each_serializer: ProjectSerializer, status: :ok
    end
    
    def show
        @project = Project.find(params[:id])
        @steps = @project.steps
    end
    
    def new
        @project = Project.new
    end
    
    def create
        @project = Project.new(project_params)
        @project.save
    
        redirect_to projects_path
    end

    def destroy
        @project = current_user.projects.find(params[:id]) 
        @project.destroy
        render json: { message: 'Project deleted successfully' }, status: :ok
    end
    
    private
    
    def project_params
        params.require(:project).permit(:name)
    end
end
