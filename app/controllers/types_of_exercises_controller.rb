class TypesOfExercisesController < ApplicationController
  # GET /types_of_exercises
  # GET /types_of_exercises.xml
  def index
    @types_of_exercises = TypesOfExercise.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @types_of_exercises }
    end
  end

  # GET /types_of_exercises/1
  # GET /types_of_exercises/1.xml
  def show
    @types_of_exercise = TypesOfExercise.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @types_of_exercise }
    end
  end

  # GET /types_of_exercises/new
  # GET /types_of_exercises/new.xml
  def new
    @types_of_exercise = TypesOfExercise.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @types_of_exercise }
    end
  end

  # GET /types_of_exercises/1/edit
  def edit
    @types_of_exercise = TypesOfExercise.find(params[:id])
  end

  # POST /types_of_exercises
  # POST /types_of_exercises.xml
  def create
    @types_of_exercise = TypesOfExercise.new(params[:types_of_exercise])

    respond_to do |format|
      if @types_of_exercise.save
        flash[:notice] = 'TypesOfExercise was successfully created.'
        format.html { redirect_to(@types_of_exercise) }
        format.xml  { render :xml => @types_of_exercise, :status => :created, :location => @types_of_exercise }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @types_of_exercise.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /types_of_exercises/1
  # PUT /types_of_exercises/1.xml
  def update
    @types_of_exercise = TypesOfExercise.find(params[:id])

    respond_to do |format|
      if @types_of_exercise.update_attributes(params[:types_of_exercise])
        flash[:notice] = 'TypesOfExercise was successfully updated.'
        format.html { redirect_to(@types_of_exercise) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @types_of_exercise.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /types_of_exercises/1
  # DELETE /types_of_exercises/1.xml
  def destroy
    @types_of_exercise = TypesOfExercise.find(params[:id])
    @types_of_exercise.destroy

    respond_to do |format|
      format.html { redirect_to(types_of_exercises_url) }
      format.xml  { head :ok }
    end
  end
end
