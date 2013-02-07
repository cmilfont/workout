class ItensController < ApplicationController
  
  respond_to :html, :json, :xml
  
  def show
    @item = Item.find params[:id]
    respond_with @item, :include => [:exercicio]
  end
  
  def create
    @item = Item.create params[:item]
    respond_with @item, :include => [:exercicio]
  end
    
end