class VideosOfExercisesController < ApplicationController
  # GET /videos_of_exercises
  # GET /videos_of_exercises.xml
  def index
    @videos_of_exercises = VideosOfExercise.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @videos_of_exercises }
    end
  end

  # GET /videos_of_exercises/1
  # GET /videos_of_exercises/1.xml
  def show
    @videos_of_exercise = VideosOfExercise.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @videos_of_exercise }
    end
  end

  # GET /videos_of_exercises/new
  # GET /videos_of_exercises/new.xml
  def new
    @videos_of_exercise = VideosOfExercise.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @videos_of_exercise }
    end
  end

  # GET /videos_of_exercises/1/edit
  def edit
    @videos_of_exercise = VideosOfExercise.find(params[:id])
  end

  # POST /videos_of_exercises
  # POST /videos_of_exercises.xml
  def create
    @videos_of_exercise = VideosOfExercise.new(params[:videos_of_exercise])

    respond_to do |format|
      if @videos_of_exercise.save
        flash[:notice] = 'VideosOfExercise was successfully created.'
        format.html { redirect_to(@videos_of_exercise) }
        format.xml  { render :xml => @videos_of_exercise, :status => :created, :location => @videos_of_exercise }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @videos_of_exercise.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /videos_of_exercises/1
  # PUT /videos_of_exercises/1.xml
  def update
    @videos_of_exercise = VideosOfExercise.find(params[:id])

    respond_to do |format|
      if @videos_of_exercise.update_attributes(params[:videos_of_exercise])
        flash[:notice] = 'VideosOfExercise was successfully updated.'
        format.html { redirect_to(@videos_of_exercise) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @videos_of_exercise.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /videos_of_exercises/1
  # DELETE /videos_of_exercises/1.xml
  def destroy
    @videos_of_exercise = VideosOfExercise.find(params[:id])
    @videos_of_exercise.destroy

    respond_to do |format|
      format.html { redirect_to(videos_of_exercises_url) }
      format.xml  { head :ok }
    end
  end
end
