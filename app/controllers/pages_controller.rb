class PagesController < ApplicationController

  def index
    @pages = Page.all
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      redirect_to page_path
    else
      render "new"
    end
  end

  def show
    @page = Page.find(params[:id])
  end

# Scraper::page_create ( ---- calling the page_create method from the scraper.rb Scraper module )


  private

  def page_params
    params.require(:pages).permit(:title, :image, :body, :category)
  end
end
