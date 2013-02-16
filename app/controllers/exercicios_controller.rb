class ExerciciosController < ApplicationController
  
  respond_to :json, :html
  before_filter :find_exercicio, :only => [:show, :update, :destroy]
  
  def index
    respond_with Exercicio.all
  end
  
  def show
    respond_with @exercicio
  end
  
  def create
    respond_with Exercicio.create(params[:exercicio])
  end
  
  def update
    @exercicio.update_attributes params[:exercicio]
    respond_to do |format|
      format.json {
        if @exercicio.valid?
          render :json => @exercicio
        else
          render :json => {
            :errors => @exercicio.errors
          }, :status => :unprocessable_entity
        end
      }
    end
  end
  
  def destroy
    @exercicio.destroy
    respond_to do |format|
      format.json {
        if @exercicio.destroyed?
          render :json => @exercicio
        else
          render :json => {
            :errors => @exercicio.errors
          }, :status => :unprocessable_entity
        end
      }
    end
  end
  
  private
  def find_exercicio
    @exercicio = Exercicio.find params[:id]
  end
  
end