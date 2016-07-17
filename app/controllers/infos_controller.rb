class InfosController < ApplicationController
  before_action :set_info, only: [:show, :edit, :update, :destroy]

  def index
    @infos = Info.all
  end

  def new
    @info = Info.new
  end

  def edit
  end

  def create
    @info = Info.new(info_params)

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

  #TODO: def archive 
  #  @info.archived = true
    
  #  if @info.update(archive_param)
  #    redirect_to infos_url, notice: 'Info archived.'
  #  end
  #end

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
    params.require(:info).permit(:user_id, :title, :content)
  end

  def archive_params
    params.require(:info).permit(:archived)
  end
end
