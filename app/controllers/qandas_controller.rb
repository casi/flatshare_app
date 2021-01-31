# frozen_string_literal: true

class QandasController < ApplicationController
  before_action :logged_in_user, only: %i[index edit update]

  def index
    @qandas = Qanda.all
  end

  def new
    @qanda = Qanda.new
  end

  def edit
    @qanda = Qanda.find(params[:id])
  end

  def create
    @qanda = Qanda.new(qanda_params)

    if @qanda.save
      flash[:success] = t 'controllers.qandas.create.created'
      redirect_to qandas_url
    else
      render :new
    end
  end

  def update
    @qanda = Qanda.find(params[:id])

    if @qanda.update(qanda_params)
      flash[:success] = t 'controllers.qandas.update.updated.'
      redirect_to qandas_url
    else
      render :edit
    end
  end

  private

  def qanda_params
    params.require(:qanda).permit(:question, :answer)
  end
end
