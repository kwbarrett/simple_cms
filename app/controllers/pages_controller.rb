class PagesController < ApplicationController

  layout 'admin'

  before_action(:confirm_logged_in)
  before_action :set_page, only: [:show, :edit, :update, :delete, :destroy]
  before_action :find_subjects, only: [:new, :edit, :create, :update]
  before_action :set_page_count, only: [:edit, :update, :new, :create]

  def index
    @pages = Page.sorted
  end

  def show
    # @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
    # @page_count = Page.count + 1
    # @subjects = Subject.sorted
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      flash[:notice] = "Page created!"
      redirect_to(pages_path)
    else
      # @page_count = Page.count + 1
      # @subjects = Subject.sorted
      render 'new'
    end
  end

  def edit
    # @page = Page.find(params[:id])
    # @page_count = Page.count
    # @subjects = Subject.sorted
  end

  def update
    # @page = Page.find(params[:id])
    if @page.update_attributes(page_params)
      flash[:notice] = "Page updated!"
      redirect_to(page_path(@page))
    else
      # @page_count = Page.count
      # @subjects = Subject.sorted
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

    def find_subjects
      @subjects = Subject.sorted
    end

    def set_page_count
      @page_count = Page.count
      if params[:action] == 'new' || params[:action] == 'create'
        @page_count += 1
      end
    end

end
