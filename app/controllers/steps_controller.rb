class StepsController < ApplicationController
    before_action :set_project
    before_action :set_step, only: [:destroy]

    def destroy
        if @step.destroy
            render json: { message: 'Step deleted successfully' }, status: :ok
        else
            render json: { errors: @step.errors.full_messages }, status: :unprocessable_entity
        end
    end

    private
    def set_project
        @project = Project.find(params[:project_id])
    end

    def set_step
        @step = @project.steps.find(params[:id])
    rescue ActiveRecord::RecordNotFound
        render json: { error: 'Step not found' }, status: :not_found
    end

    def step_params
        params.require(:step).permit(:description, :start_date, :end_date, :completed)
    end
end
