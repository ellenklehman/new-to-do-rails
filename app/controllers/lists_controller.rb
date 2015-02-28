class ListsController < ApplicationController
  def index
    @lists = List.all
    render :index
  end

  def show
    @list = List.find(params[:id])
    render :show
  end

  def new
    @list = List.new
    render :new
  end

  def create
    @list = List.new(name: params[:name])
    if @list.save
      flash[:notice] = "List successfully added!"
      redirect_to "/lists"
    else
      render :new
    end
  end

  def edit
    @list = List.find(params[:id])
    render :edit
  end

  def update
    @list = List.find(params[:id])
    if @list.update(name: params[:name])
      flash[:notice] = "List successfully updated!"
      redirect_to "/lists/#{@list.id}"
    else
      render :edit
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    flash[:notice] = "List successfully deleted."
    redirect_to "/lists"
  end
end
