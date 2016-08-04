class QandasController < ApplicationController

  def index
    @qandas = Qanda.all
  end

  def show
    @qanda = Qanda.find(params[:id])
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
      flash[:success] = 'Question successfully created.'
      redirect_to qandas_url
    else
      render :new
    end
  end

  def update
    @qanda = Qanda.find(params[:id])

    if @qanda.update(qanda_params)
      flash[:success] = 'Question/Answer updated.'
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
