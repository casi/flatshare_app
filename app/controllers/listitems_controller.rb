class ListitemsController < ApplicationController

  def index
    @shopping_items = Listitem.all
    @shopping_item = Listitem.new
  end

  def create
    @shopping_item = Listitem.new(list_params)
    @shopping_item.done = false

    if @shopping_item.save
      flash[:success] = 'Shopping list item added.'
      redirect_to listitems_url
    end
  end

  def update
  	@shopping_item = Listitem.find(params[:id])
    
    if @shopping_item.update(list_params)
      redirect_to listitems_url
    else
      render :edit
    end
  end

  def destroy_all
    @shopping_items = Listitem.where(done: true)

    if @shopping_items.count > 0
      if @shopping_items.destroy_all
        flash[:success] = 'Shopping list items, which are already bought, deleted.'
        redirect_to listitems_url
      end
    end
  end

  private

  def list_params
    params.require(:listitem).permit(:item, :done)
  end

end
