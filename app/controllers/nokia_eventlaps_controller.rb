class NokiaEventlapsController < ApplicationController
  # GET /nokia_eventlaps
  # GET /nokia_eventlaps.xml
  def index
    @nokia_eventlaps = NokiaEventlap.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @nokia_eventlaps }
    end
  end

  # GET /nokia_eventlaps/1
  # GET /nokia_eventlaps/1.xml
  def show
    @nokia_eventlap = NokiaEventlap.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @nokia_eventlap }
    end
  end

  # GET /nokia_eventlaps/new
  # GET /nokia_eventlaps/new.xml
  def new
    @nokia_eventlap = NokiaEventlap.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @nokia_eventlap }
    end
  end

  # GET /nokia_eventlaps/1/edit
  def edit
    @nokia_eventlap = NokiaEventlap.find(params[:id])
  end

  # POST /nokia_eventlaps
  # POST /nokia_eventlaps.xml
  def create
    @nokia_eventlap = NokiaEventlap.new(params[:nokia_eventlap])

    respond_to do |format|
      if @nokia_eventlap.save
        flash[:notice] = 'NokiaEventlap was successfully created.'
        format.html { redirect_to(@nokia_eventlap) }
        format.xml  { render :xml => @nokia_eventlap, :status => :created, :location => @nokia_eventlap }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @nokia_eventlap.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /nokia_eventlaps/1
  # PUT /nokia_eventlaps/1.xml
  def update
    @nokia_eventlap = NokiaEventlap.find(params[:id])

    respond_to do |format|
      if @nokia_eventlap.update_attributes(params[:nokia_eventlap])
        flash[:notice] = 'NokiaEventlap was successfully updated.'
        format.html { redirect_to(@nokia_eventlap) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @nokia_eventlap.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /nokia_eventlaps/1
  # DELETE /nokia_eventlaps/1.xml
  def destroy
    @nokia_eventlap = NokiaEventlap.find(params[:id])
    @nokia_eventlap.destroy

    respond_to do |format|
      format.html { redirect_to(nokia_eventlaps_url) }
      format.xml  { head :ok }
    end
  end
end
