class TasksController < ApplicationController
  def new
    list = List.find(params[:list_id])
    @task = list.tasks.new
    render :new
  end

  def create
    @task = Task.new(description: params[:description], list_id: params[:list_id])
    if @task.save
      flash[:notice] = "Task successfully added!"
      redirect_to "/lists/#{@task.list.id}"
    else
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
    render :edit
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(description: params[:description])
      flash[:notice] = "Task successfully updated!"
      redirect_to "/lists/#{@task.list.id}"
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:notice] = "Task successfully deleted."
    redirect_to "/lists/#{@task.list.id}"
  end
end
