class RotinasController < ApplicationController
  
  respond_to :html, :json
  
  def index
    @rotinas = Rotina.all
    respond_with @rotinas, :include => {:itens => {:include => :exercicio}}
  end
  
  def show
    @rotina = Rotina.find params[:id]
    respond_with @rotina, :include => {:itens => {:include => :exercicio}}
  end
  
end
