class Admin::GalerieController < ApplicationController  
  def index
    @galerie = Galeria.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @galerie }
    end
  end

  # GET /galerie/new
  # GET /galerie/new.xml
  def new
    @galeria = Galeria.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @galeria }
    end
  end

  # GET /galerie/1/edit
  def edit
    @galeria = Galeria.find(params[:id])
    render :action => "new"
  end

  # POST /galerie
  # POST /galerie.xml
  def create
    @galeria = Galeria.new(params[:galeria])

    respond_to do |format|
      if @galeria.save
        flash[:notice] = 'Galeria została utworzona.'
        format.html { redirect_to admin_galerie_path }
        format.xml  { render :xml => @galeria, :status => :created, :location => @galeria }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @galeria.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /galerie/1
  # PUT /galerie/1.xml
  def update
    @galeria = Galeria.find(params[:id])

    respond_to do |format|
      if @galeria.update_attributes(params[:galeria])
        flash[:notice] = 'Galeria została zapisana.'
        format.html { redirect_to admin_galerie_path }
        format.xml  { head :ok }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @galeria.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /galerie/1
  # DELETE /galerie/1.xml
  def destroy
    @galeria = Galeria.find(params[:id])
    @galeria.destroy

    respond_to do |format|
      format.html { redirect_to admin_galerie_path }
      fomrat.js { render :nothing => true }
      format.xml  { head :ok }
    end
  end
end
