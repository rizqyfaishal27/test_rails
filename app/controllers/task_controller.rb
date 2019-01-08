class TaskController < ApplicationController
    def index
        @tasks = Task.all
    end

    def new 

    end

    def create
        Task.transaction do 
            @task = Task.create(name: task_params[:name], description: task_params[:description])
            saved_task = @task.save!

            task_params[:changes].each do |change_text|
                @change = Change.create(text: change_text, task_id: @task.id)
                @change.save!
            end

            if saved_task
                redirect_to @task
            else
                render new_article_path
            end
        end
    end

    def show
        @task = Task.find(params[:id])
    end

    private 

    def task_params
        params.require(:task).permit(:name, :description, changes: [])
    end
end
