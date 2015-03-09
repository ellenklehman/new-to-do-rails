class TasksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @task = @list.tasks.new
  end

  def create
    @list = List.find(params[:list_id])
    @task = @list.task.new(params[:task])
    if @task.save
      flash[:notice] = "Task successfully added!"
      redirect_to list_path(@task.list)
    else
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(description: params[:description])
      flash[:notice] = "Task successfully updated!"
      redirect_to list_path(@task.list)
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:notice] = "Task successfully deleted."
    redirect_to list_path(@task.list)
  end
end
