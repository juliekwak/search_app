class SitesController < ApplicationController

  def index
    @sites = Site.all
  end


  def new
    @site = Site.new
  end

  def create
    @site = Site.new(site_params)

    if @site.save
      redirect_to @site
    else
      render 'new'
    end
  end

  def edit
    @site = Site.find(params[:id])
  end

  def update
    @site = Site.find(params[:id])
    if @site.update(site_params)
      redirect_to site_path(@site), notice: "Site successfully updated!"
    else
      render "edit"
    end
  end


  def show
    @site = Site.find(params[:id])
  end

  def destroy
    @site = Site.find(params[:id])
    @site.destroy
    redirect_to sites_path
  end


  private

  def site_params
    params.require(:site).permit(:name, :url, :category)
  end

end
