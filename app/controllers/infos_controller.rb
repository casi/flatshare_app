# frozen_string_literal: true

class InfosController < ApplicationController
  before_action :logged_in_user, only: %i[index show edit update archived]
  before_action :set_info, only: %i[show edit update]

  def index
    @infos = Info.not_archived
    @archived_count = Info.archived.size
  end

  def show
    @info = Info.find(params[:id])
  end

  def new
    @info = Info.new
  end

  def edit
    @info = Info.find(params[:id])
    if @info.user_id == current_user.id
      render :edit
    else
      render :show
    end
  end

  def create
    @info = current_user.infos.build(info_params)
    @info.archived = false

    if @info.save
      flash[:success] = t 'controllers.infos.create.created'
      redirect_to infos_url
    else
      render :new
    end
  end

  def update
    if @info.update(info_params)
      flash[:success] = t 'controllers.infos.update.updated'
      redirect_to infos_url
    else
      render :edit
    end
  end

  def archived
    @infos = Info.archived
    render :archived_infos
  end

  private

  def info_params
    params.require(:info).permit(:title, :content, :archived)
  end

  # Before actions

  def set_info
    @info = Info.find(params[:id])
  end
end
