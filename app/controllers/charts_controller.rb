class ChartsController < ApplicationController
before_filter :authenticate, :except => [:index, :show]  
# GET /charts
  # GET /charts.xml
  def index
    @charts = Chart.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @charts }
    end
  end

  # GET /charts/1
  # GET /charts/1.xml
  def show
  seatname = Chart.find_by_id(params[:id]).name
  if seatname == 'Empty...' then
    lastseat = Chart.find_by_name(current_user.fname)
       if lastseat != nil
           lastseat.name = 'Empty...'
           lastseat.save
       end
    selectedseat = Chart.find(params[:id])
    selectedseat.name = current_user.fname
    selectedseat.save
  end
    respond_to do |format|
      format.html {redirect_to(charts_path)}
      format.js
    end
  end

  # GET /charts/new
  # GET /charts/new.xml
  def new
    @chart = Chart.new
  
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @chart }
    end
  end

  # GET /charts/1/edit
  def edit
    @chart = Chart.find(params[:id])
  end

  # POST /charts
  # POST /charts.xml
  def create
    @chart = Chart.new(params[:chart])

    respond_to do |format|
      if @chart.save
        format.html { redirect_to(@chart, :notice => 'Chart was successfully created.') }
        format.xml  { render :xml => @chart, :status => :created, :location => @chart }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @chart.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /charts/1
  # PUT /charts/1.xml
  def update
    @chart = Chart.find(params[:id])

    respond_to do |format|
      if @chart.update_attributes(params[:chart])
        format.html { redirect_to(@chart, :notice => 'Chart was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @chart.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /charts/1
  # DELETE /charts/1.xml
  def destroy
    seatname = Chart.find_by_id(params[:id]).name
    currentuser = Chart.find(params[:id])
    currentname = current_user.fname
    if seatname == currentname
       seatname = "Empty..."
       seatname.save
    end
    respond_to do |format|
      format.html { redirect_to(charts_url) }
      format.js  
    end
  end
end

 

