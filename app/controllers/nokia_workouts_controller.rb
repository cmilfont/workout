class NokiaWorkoutsController < ApplicationController
  # GET /nokia_workouts
  # GET /nokia_workouts.xml
  def index
    @nokia_workouts = NokiaWorkout.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @nokia_workouts }
    end
  end

  # GET /nokia_workouts/1
  # GET /nokia_workouts/1.xml
  def show
    @nokia_workout = NokiaWorkout.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @nokia_workout }
    end
  end

  # GET /nokia_workouts/new
  # GET /nokia_workouts/new.xml
  def new
    @nokia_workout = NokiaWorkout.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @nokia_workout }
    end
  end

  # GET /nokia_workouts/1/edit
  def edit
    @nokia_workout = NokiaWorkout.find(params[:id])
  end

  # POST /nokia_workouts
  # POST /nokia_workouts.xml
  def create
    @nokia_workout = NokiaWorkout.new(params[:nokia_workout])

    respond_to do |format|
      if @nokia_workout.save
        flash[:notice] = 'NokiaWorkout was successfully created.'
        format.html { redirect_to(@nokia_workout) }
        format.xml  { render :xml => @nokia_workout, :status => :created, :location => @nokia_workout }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @nokia_workout.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /nokia_workouts/1
  # PUT /nokia_workouts/1.xml
  def update
    @nokia_workout = NokiaWorkout.find(params[:id])

    respond_to do |format|
      if @nokia_workout.update_attributes(params[:nokia_workout])
        flash[:notice] = 'NokiaWorkout was successfully updated.'
        format.html { redirect_to(@nokia_workout) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @nokia_workout.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /nokia_workouts/1
  # DELETE /nokia_workouts/1.xml
  def destroy
    @nokia_workout = NokiaWorkout.find(params[:id])
    @nokia_workout.destroy

    respond_to do |format|
      format.html { redirect_to(nokia_workouts_url) }
      format.xml  { head :ok }
    end
  end
end
