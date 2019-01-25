class SubjectsController < ApplicationController

  before_action :set_subject, only: [:show, :edit, :update, :delete, :destroy]


  def index
    @subjects = Subject.sorted
  end

  def show
    # @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new(:name => 'Default')
  end

  def create
    @subject = Subject.new(subject_params)
    if @subject.save
      flash[:notice] = "Subject created!"
      redirect_to(subjects_path)
    else
      render 'new'
    end
  end

  def edit
    # @subject = Subject.find(params[:id])
  end

  def update
    # @subject = Subject.find(params[:id])
    if @subject.update_attributes(subject_params)
      flash[:notice] = "Subject updated!"
      redirect_to(subject_path(@subject))
    else
      render 'edit'
    end
  end

  def delete
    # @subject = Subject.find(params[:id])
  end

  def destroy
    # @subject = Subject.find(params[:id])
    @subject.destroy
    flash[:notice] = "Subject #{ @subject.name } destroyed!"
    redirect_to(subjects_path)
  end

  private

    def subject_params
      params.require(:subject).permit(:name, :position, :visible)
    end

  def set_subject
    @subject = Subject.find(params[:id])
  end
end
