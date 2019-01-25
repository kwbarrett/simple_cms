class SectionsController < ApplicationController

  before_action :set_section, only: [:show, :edit, :update, :delete, :destroy]

  def index
    @sections = Section.sorted
  end

  def show
  end

  def new
    @section = Section.new
  end

  def create
    @section = Section.new(section_params)
    if @section.save
      flash[:notice] = "Section created!"
      redirect_to(sections_path)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @section.update_attributes(section_params)
      flash[:notice] = "Section updated!"
      redirect_to(section_path(@section))
    else
      render 'edit'
    end
  end

  def delete
  end

  def destroy
    @section.destroy
    flash[:notice] = "Section destroyed!"
    redirect_to(sections_path)
  end

  private

    def set_section
      @section = Section.find(params[:id])
    end

    def section_params
      params.require(:section).permit(:position, :page_id, :name, :visible, :content_type, :content)
    end
end
