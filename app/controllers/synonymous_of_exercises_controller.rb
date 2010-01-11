class SynonymousOfExercisesController < ApplicationController
  # GET /synonymous_of_exercises
  # GET /synonymous_of_exercises.xml
  def index
    @synonymous_of_exercises = SynonymousOfExercise.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @synonymous_of_exercises }
    end
  end

  # GET /synonymous_of_exercises/1
  # GET /synonymous_of_exercises/1.xml
  def show
    @synonymous_of_exercise = SynonymousOfExercise.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @synonymous_of_exercise }
    end
  end

  # GET /synonymous_of_exercises/new
  # GET /synonymous_of_exercises/new.xml
  def new
    @synonymous_of_exercise = SynonymousOfExercise.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @synonymous_of_exercise }
    end
  end

  # GET /synonymous_of_exercises/1/edit
  def edit
    @synonymous_of_exercise = SynonymousOfExercise.find(params[:id])
  end

  # POST /synonymous_of_exercises
  # POST /synonymous_of_exercises.xml
  def create
    @synonymous_of_exercise = SynonymousOfExercise.new(params[:synonymous_of_exercise])

    respond_to do |format|
      if @synonymous_of_exercise.save
        flash[:notice] = 'SynonymousOfExercise was successfully created.'
        format.html { redirect_to(@synonymous_of_exercise) }
        format.xml  { render :xml => @synonymous_of_exercise, :status => :created, :location => @synonymous_of_exercise }
        format.json  { render :json => @synonymous_of_exercise, :status => :created, :location => @synonymous_of_exercise }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @synonymous_of_exercise.errors, :status => :unprocessable_entity }
        format.json  { render :json => @synonymous_of_exercise.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /synonymous_of_exercises/1
  # PUT /synonymous_of_exercises/1.xml
  def update
    @synonymous_of_exercise = SynonymousOfExercise.find(params[:id])

    respond_to do |format|
      if @synonymous_of_exercise.update_attributes(params[:synonymous_of_exercise])
        flash[:notice] = 'SynonymousOfExercise was successfully updated.'
        format.html { redirect_to(@synonymous_of_exercise) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @synonymous_of_exercise.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /synonymous_of_exercises/1
  # DELETE /synonymous_of_exercises/1.xml
  def destroy
    @synonymous_of_exercise = SynonymousOfExercise.find(params[:id])
    @synonymous_of_exercise.destroy

    respond_to do |format|
      format.html { redirect_to(synonymous_of_exercises_url) }
      format.xml  { head :ok }
      format.json { head :ok }
    end
  end
end

