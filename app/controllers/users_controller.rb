class UsersController < ApplicationController
  #before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    @user.save do |result|
      if result
        flash[:notice] = "Perfil criado com sucesso!"
        redirect_back_or_default account_url
      else
        render :action => :new
      end
    end
  end

  def index
    redirect_back_or_default root_url
  end

  def show
    if params[:id]
      @user = User.find_by_login params[:id]
      render :status => 404 unless @user
    end
    @user = current_user unless @user
    redirect_back_or_default root_url unless @user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user # makes our views "cleaner" and more consistent
    @user.attributes = params[:user]
    @user.save do |result|
      if result
        flash[:notice] = "Account updated!"
        redirect_to account_url
      else
        render :action => :edit
      end
    end
  end
end

