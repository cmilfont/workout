class CommentsOfExercisesController < ApplicationController
  # GET /comments_of_exercises
  # GET /comments_of_exercises.xml
  def index
    @comments_of_exercises = CommentsOfExercise.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @comments_of_exercises }
    end
  end

  # GET /comments_of_exercises/1
  # GET /comments_of_exercises/1.xml
  def show
    @comments_of_exercise = CommentsOfExercise.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @comments_of_exercise }
    end
  end

  # GET /comments_of_exercises/new
  # GET /comments_of_exercises/new.xml
  def new
    @comments_of_exercise = CommentsOfExercise.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @comments_of_exercise }
    end
  end

  # GET /comments_of_exercises/1/edit
  def edit
    @comments_of_exercise = CommentsOfExercise.find(params[:id])
  end

  # POST /comments_of_exercises
  # POST /comments_of_exercises.xml
  def create
    @comments_of_exercise = CommentsOfExercise.new(params[:comments_of_exercise])

    respond_to do |format|
      if @comments_of_exercise.save
        flash[:notice] = 'CommentsOfExercise was successfully created.'
        format.html { redirect_to(@comments_of_exercise) }
        format.xml  { render :xml => @comments_of_exercise, :status => :created, :location => @comments_of_exercise }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @comments_of_exercise.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /comments_of_exercises/1
  # PUT /comments_of_exercises/1.xml
  def update
    @comments_of_exercise = CommentsOfExercise.find(params[:id])

    respond_to do |format|
      if @comments_of_exercise.update_attributes(params[:comments_of_exercise])
        flash[:notice] = 'CommentsOfExercise was successfully updated.'
        format.html { redirect_to(@comments_of_exercise) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @comments_of_exercise.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /comments_of_exercises/1
  # DELETE /comments_of_exercises/1.xml
  def destroy
    @comments_of_exercise = CommentsOfExercise.find(params[:id])
    @comments_of_exercise.destroy

    respond_to do |format|
      format.html { redirect_to(comments_of_exercises_url) }
      format.xml  { head :ok }
    end
  end
end
