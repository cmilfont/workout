class TagsOfExercisesController < ApplicationController
  # GET /tags_of_exercises
  # GET /tags_of_exercises.xml
  def index
    @tags_of_exercises = TagsOfExercise.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tags_of_exercises }
    end
  end

  # GET /tags_of_exercises/1
  # GET /tags_of_exercises/1.xml
  def show
    @tags_of_exercise = TagsOfExercise.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tags_of_exercise }
    end
  end

  # GET /tags_of_exercises/new
  # GET /tags_of_exercises/new.xml
  def new
    @tags_of_exercise = TagsOfExercise.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tags_of_exercise }
    end
  end

  # GET /tags_of_exercises/1/edit
  def edit
    @tags_of_exercise = TagsOfExercise.find(params[:id])
  end

  # POST /tags_of_exercises
  # POST /tags_of_exercises.xml
  def create
    @tags_of_exercise = TagsOfExercise.new(params[:tags_of_exercise])

    respond_to do |format|
      if @tags_of_exercise.save
        flash[:notice] = 'TagsOfExercise was successfully created.'
        format.html { redirect_to(@tags_of_exercise) }
        format.xml  { render :xml => @tags_of_exercise, :status => :created, :location => @tags_of_exercise }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tags_of_exercise.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tags_of_exercises/1
  # PUT /tags_of_exercises/1.xml
  def update
    @tags_of_exercise = TagsOfExercise.find(params[:id])

    respond_to do |format|
      if @tags_of_exercise.update_attributes(params[:tags_of_exercise])
        flash[:notice] = 'TagsOfExercise was successfully updated.'
        format.html { redirect_to(@tags_of_exercise) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tags_of_exercise.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tags_of_exercises/1
  # DELETE /tags_of_exercises/1.xml
  def destroy
    @tags_of_exercise = TagsOfExercise.find(params[:id])
    @tags_of_exercise.destroy

    respond_to do |format|
      format.html { redirect_to(tags_of_exercises_url) }
      format.xml  { head :ok }
    end
  end
end
