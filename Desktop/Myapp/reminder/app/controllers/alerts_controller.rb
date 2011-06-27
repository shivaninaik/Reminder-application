class AlertsController < ApplicationController
  #before_filter :authorize, :only => [:create, :update, :destroy]
  
  # GET /alerts
  # GET /alerts.xml
  def index
    user = current_user
    @alerts = user.alerts

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @alerts }
    end
  end
  
  def shiv
    
  end

  # GET /alerts/1
  # GET /alerts/1.xml
  def show
    begin
     user = current_user
     @alert = user.alerts.find(params[:id])
        rescue ActiveRecord::RecordNotFound
          logger.error "Attempt to access invalid cart #{params[:id]}"
          redirect_to monitor_url, :notice => 'Invalid alert'
        else
          respond_to do |format|
          format.html # show.html.erb
          format.xml  { render :xml => @alert }
        end
      end
  end

  # GET /alerts/new
  # GET /alerts/new.xml
  def new
    @alert = Alert.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @alert }
    end
  end

  # GET /alerts/1/edit
  def edit
    user = current_user
    @alert = user.alerts.find(params[:id])
    #@alert = Alert.find(params[:id])
  end

  # POST /alerts
  # POST /alerts.xml
  def create
    user = current_user
    #@alert = Alert.new(params[:alert])
    @alert = user.alerts.build(params[:alert])

    respond_to do |format|
      if @alert.save
        format.html { redirect_to(@alert, :notice => 'Alert was successfully created.') }
        format.xml  { render :xml => @alert, :status => :created, :location => @alert }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @alert.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /alerts/1
  # PUT /alerts/1.xml
  def update
     user = current_user
     @alert = user.alerts.find(params[:id])
    #@alert = Alert.find(params[:id])

    respond_to do |format|
      if @alert.update_attributes(params[:alert])
        format.html { redirect_to(monitor_url, :notice => 'Alert was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @alert.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /alerts/1
  # DELETE /alerts/1.xml
  def destroy
    user = current_user
    @alert = user.alerts.find(params[:id])
    @alert.destroy

    respond_to do |format|
      format.html { redirect_to(monitor_url) }
      format.xml  { head :ok }
    end
  end
end
