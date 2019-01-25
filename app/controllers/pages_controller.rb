class PagesController < ApplicationController

  before_action :set_page, only: [:show, :edit, :update, :delete, :destroy]

  def index
    @pages = Page.sorted
  end

  def show
    # @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      flash[:notice] = "Page created!"
      redirect_to(pages_path)
    else
      render 'new'
    end
  end

  def edit
    # @page = Page.find(params[:id])
  end

  def update
    # @page = Page.find(params[:id])
    if @page.update_attributes(page_params)
      flash[:notice] = "Page updated!"
      redirect_to(page_path(@page))
    else
      render 'edit'
    end
  end

  def delete
    # @page = Page.find(params[:id])
  end

  def destroy
    @page.destroy
    flash[:notice] = "Page destroyed!"
    redirect_to(pages_path)
  end

  private

    def page_params
      params.require(:page).permit(:name, :position, :visible, :permalink, :subject_id)
    end

    def set_page
      @page = Page.find(params[:id])
    end


end
