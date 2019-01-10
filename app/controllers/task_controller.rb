class TaskController < ApplicationController
    before_action :authenticate_user!

    def index
        @tasks = Task.all
        @user = current_user

    end

    def new 
        @task = Task.new
    end

    def create
        Task.transaction do 
            @task = Task.create(name: task_params[:name], description: task_params[:description])
            if @task.save
                task_params[:changes].each do |change_text|
                    @change = Change.create(text: change_text, task_id: @task.id)
                    @change.save!
                end
                redirect_to @task
            else
                render 'new'
            end
        end
    end

    def show
        @task = Task.find(params[:id])
    end

    def delete

    end

    def destroy
        @task = Task.find(params[:id])

        @task.destroy

        redirect_to task_index_path
    end

    def update
        @task = Task.find(params[:id])

        if @task.update(task_params)
            redirect_to task_path
        else
            render 'edit'
        end
    end

    def edit
        @task = Task.find(params[:id])
    end

    private 

    def task_params
        params.require(:task).permit(:name, :description, changes: [])
    end
end
