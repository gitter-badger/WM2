class ConceptsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @concepts = Concept.all
  end

  def show
    @concept = Concept.find params[:id]
  end

  def new
    @concept = current_user.concepts.new
  end

  def create
    @concept = current_user.concepts.new scrub_parameters
    @concept.save
    redirect_to @concept
  end

  def destroy
    @concept = Concept.find params[:id]
    @concept.destroy
    redirect_to concepts_path
  end

private
  def scrub_parameters
    params.require(:concept).permit(:title, :description, :content)
  end
end
