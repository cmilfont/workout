class TrainingsController < ApplicationController
  # GET /trainings
  # GET /trainings.xml
  def index
    @user_id = params[:user_id] || current_user.id
    @page = params[:page] || 1
    @per_page = params[:limit] || 10
    @conditions = {:workouts => {
      :user_id => @user_id
    }}
    @training = Training.paginate :include => [:workout],
        :conditions => @conditions,
        :page => params[:page],:per_page => @per_page
#:conditions => {:workout.user_id => @user_id}

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @training }
      format.json { render :json => @training.to_json(:include => [:exercise, :workout]) }
    end
  end

  # GET /trainings/1
  # GET /trainings/1.xml
  def show
    @training = Training.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @training }
      format.json { render :json => @training, :include => [:workout, :exercise]}
    end
  end

  # GET /trainings/new
  # GET /trainings/new.xml
  def new
    @training = Training.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @training }
    end
  end

  # GET /trainings/1/edit
  def edit
    @training = Training.find(params[:id])
  end

  # POST /trainings
  # POST /trainings.xml
  def create
    @training = Training.new(params[:training])

    respond_to do |format|
      if @training.save
        flash[:notice] = 'Training was successfully created.'
        format.html { redirect_to(@training) }
        format.xml  { render :xml => @training, :status => :created, :location => @training }
        format.json { render :json => @training.to_json(:include => [:exercise, :workout]) }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @training.errors, :status => :unprocessable_entity }
        format.json  { render :json => @training.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /trainings/1
  # PUT /trainings/1.xml
  def update
    @training = Training.find(params[:id])

    respond_to do |format|
      if @training.update_attributes(params[:training])
        flash[:notice] = 'Training was successfully updated.'
        format.html { redirect_to(@training) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @training.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /trainings/1
  # DELETE /trainings/1.xml
  def destroy
    @training = Training.find(params[:id])
    @training.destroy

    respond_to do |format|
      format.html { redirect_to(trainings_url) }
      format.xml  { head :ok }
    end
  end
end

