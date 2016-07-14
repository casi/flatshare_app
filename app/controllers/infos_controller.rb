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
      redirect_to infos_url, notice: 'Info successfully created.'
    else
      render :new
    end
  end

  def update
    if @info.update(info_params)
      redirect_to infos_url, notice: 'Info updated.'
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
      redirect_to infos_url, notice: 'Info deleted.'
    end
  end

  private

  def set_info
    @info = Info.find(params[:id])
  end

  def info_params
    params.require(:info).permit(:author, :title, :content)
  end

  def archive_params
    params.require(:info).permit(:archived)
  end
end
