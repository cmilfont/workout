class RotinasController < ApplicationController
  
  respond_to :html, :json, :xml
  
  def index
    @rotinas = Rotina.all
    respond_with @rotinas, :include => {:itens => {:include => :exercicio}}
  end
  
  def show
    @rotina = Rotina.find params[:id]
    respond_with @rotina, :include => {:itens => {:include => :exercicio}}
  end
  
  def create
    @rotina = Rotina.create params[:rotina]
    respond_with @rotina, :include => {:itens => {:include => :exercicio}}
  end
  
  def update
    @rotina = Rotina.find params[:id]
    @rotina.update_attributes params[:rotina]
    respond_with @rotina, :include => {:itens => {:include => :exercicio}}
  end
  
end
