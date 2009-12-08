class WeightGoalsController < ApplicationController
  # GET /weight_goals
  # GET /weight_goals.xml
  def index
    @weight_goals = WeightGoal.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @weight_goals }
    end
  end

  # GET /weight_goals/1
  # GET /weight_goals/1.xml
  def show
    @weight_goal = WeightGoal.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @weight_goal }
    end
  end

  # GET /weight_goals/new
  # GET /weight_goals/new.xml
  def new
    @weight_goal = WeightGoal.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @weight_goal }
    end
  end

  # GET /weight_goals/1/edit
  def edit
    @weight_goal = WeightGoal.find(params[:id])
  end

  # POST /weight_goals
  # POST /weight_goals.xml
  def create
    @weight_goal = WeightGoal.new(params[:weight_goal])

    respond_to do |format|
      if @weight_goal.save
        format.html { redirect_to(@weight_goal) }
        format.xml  { render :xml => @weight_goal, :status => :created, :location => @weight_goal }
        format.json { render :json => @weight_goal, :status => :created}
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @weight_goal.errors, :status => :unprocessable_entity }
        format.json  { render :json => @weight_goal.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /weight_goals/1
  # PUT /weight_goals/1.xml
  def update
    @weight_goal = WeightGoal.find(params[:id])

    respond_to do |format|
      if @weight_goal.update_attributes(params[:weight_goal])
        flash[:notice] = 'WeightGoal was successfully updated.'
        format.html { redirect_to(@weight_goal) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @weight_goal.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /weight_goals/1
  # DELETE /weight_goals/1.xml
  def destroy
    @weight_goal = WeightGoal.find(params[:id])
    @weight_goal.destroy

    respond_to do |format|
      format.html { redirect_to(weight_goals_url) }
      format.xml  { head :ok }
    end
  end
end

