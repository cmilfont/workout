class ExerciciosController < ApplicationController
  
  respond_to :json, :html
  
  def index
    @exercicios = Exercicio.all
    respond_with @exercicios
  end
  
  def show
    @exercicio = Exercicio.find params[:id]
    respond_with @exercicio
  end
  
  def create
    @exercicio = Exercicio.create params[:exercicio]
    respond_with @exercicio
  end
  
  def update
    @exercicio = Exercicio.find params[:id]
    @exercicio.update_attributes params[:exercicio]
    respond_with @exercicio
  end
  
  def destroy
    @exercicio = Exercicio.find params[:id]
    @exercicio.destroy
    respond_with @exercicio
  end
  
end
