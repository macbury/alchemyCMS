class Admin::LinkiController < ApplicationController  
  before_filter :moderator
  
  def index
    @linki = Link.find_ordered
  end

  def new
    @link = Link.new
  end

  def edit
    @link = Link.find(params[:id])
    render :action => "new"
  end

  def create
    @link = Link.new(params[:link])
      if @link.save
        flash[:notice] = 'Link do menu został dodany!'
        redirect_to admin_linki_path
      else
        render :action => "new"
      end

  end

  def update
    @link = Link.find(params[:id])
      if @link.update_attributes(params[:link])
        flash[:notice] = 'Link w menu został zaktualizowany'
        redirect_to admin_linki_path
      else
        render :action => "new" 
      end
  end

  def order
    respond_to do |format|
      format.html { redirect_to :action => "index" }
      format.js {
        params[:menuList].each_with_index do |id, index|
          Link.update(id, :order => index)
        end
        render :inline => "<%= generuj_menu %>"
      }
    end
  end

  def destroy
    respond_to do |format|
      format.html { redirect_to :action => "index" }
      format.js {
        @link = Link.find(params[:id])
        @link.destroy()

        render :nothing => true
      }
    end
  end
end
