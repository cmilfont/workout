class ExerciciosController < ApplicationController
  
  respond_to :json, :html
  
  def index
    @exercicios = Exercicio.all
    respond_with  @exercicios
  end
  
end
