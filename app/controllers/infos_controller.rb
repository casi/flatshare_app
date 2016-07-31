class InfosController < ApplicationController
  before_action :set_info, only: [:show, :edit, :update, :destroy]

  def index
    @infos = Info.not_archived
    @archived_count = Info.archived.count
  end

  def show 
    @info = Info.find(params[:id])
  end

  def new
    @info = Info.new
  end

  def edit
  end

  def create
    @info = Info.new(info_params)
    @info.archived = false

    if @info.save
      flash[:success] = 'Info successfully created.'
      redirect_to infos_url
    else
      render :new
    end
  end

  def update
    if @info.update(info_params)
      flash[:success] = 'Info updated.'
      redirect_to infos_url
    else
      render :edit
    end
  end

  def archived
    @infos = Info.archived
    render :archived_infos
  end

  def destroy
    if @info.destroy
      flash[:success] = 'Info deleted.'
      redirect_to infos_url
    end
  end

  private

  def set_info
    @info = Info.find(params[:id])
  end

  def info_params
    params.require(:info).permit(:user_id, :title, :content, :archived)
  end

end
