class WeightsController < ApplicationController
  # GET /weights
  # GET /weights.xml
  def index
    @user_id = params[:user_id] || current_user.id
    @page = params[:page] || 1
    @per_page = params[:limit] || 10
    @order_by = params[:order] || "created_at DESC"
    @weights = Weight.paginate(:conditions => {:user_id => @user_id},
      :page => @page,:per_page => @per_page, :order => @order_by)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @weights }
      format.json  { render :json => @weights }
    end
  end

  # GET /weights/1
  # GET /weights/1.xml
  def show
    @weight = Weight.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @weight }
    end
  end

  # GET /weights/new
  # GET /weights/new.xml
  def new
    @weight = Weight.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @weight }
    end
  end

  # GET /weights/1/edit
  def edit
    @weight = Weight.find(params[:id])
  end

  # POST /weights
  # POST /weights.xml
  def create
    @weight = Weight.new(params[:weight])

    respond_to do |format|
      if @weight.save
        flash[:notice] = 'Weight was successfully created.'
        format.html { redirect_to(@weight) }
        format.json { render :json => @weight.weight, :status => :created, :location => @weight}
        format.xml  { render :xml => @weight, :status => :created, :location => @weight }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @weight.errors, :status => :unprocessable_entity }
        format.json  { render :json => @weight.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /weights/1
  # PUT /weights/1.xml
  def update
    @weight = Weight.find(params[:id])

    respond_to do |format|
      if @weight.update_attributes(params[:weight])
        flash[:notice] = 'Weight was successfully updated.'
        format.html { redirect_to(@weight) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @weight.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /weights/1
  # DELETE /weights/1.xml
  def destroy
    @weight = Weight.find(params[:id])
    @weight.destroy

    respond_to do |format|
      format.html { redirect_to(weights_url) }
      format.xml  { head :ok }
    end
  end
end

