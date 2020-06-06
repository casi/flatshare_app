class ListitemsController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]

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
    end
  end

  def destroy
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
