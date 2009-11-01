class UserSessionsController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])

    respond_to do |format|
      @user_session.save do |result|
        if result
          format.json { render :json => { :persistence_token =>
              @user_session #.attempted_record.persistence_token
            }
          }
          format.html {
            flash[:login] = "Seja bem-vindo[a] "
            redirect_back_or_default account_url
          }
        else
          format.html { render :action => :new }
          format.json { render :json => @user_session.errors, :status => :unprocessable_entity}
        end
      end
    end
  end

  def destroy
    #current_user_session.destroy
    #flash[:notice] = "Logout successful!"
    #redirect_back_or_default new_user_session_url

    current_user.forget! if current_user.logged_in?
    cookies.delete :auth_token
    reset_session
    flash[:notice] = "You have been logged out."
    redirect_back_or_default new_user_session_url
  end
end

