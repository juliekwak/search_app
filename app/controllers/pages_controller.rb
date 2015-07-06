class PagesController < ApplicationController

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

  def scrape
    @page = Page.find(params[:id])

  end



  private

  def page_params
    params.require(:pages).permit(:title, :image, :body, :category)
  end
end
