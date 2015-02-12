class ConceptsController < ApplicationController

  def show
    @concept = Concept.find(params[:id])
  end

  def new
  end

  def create
    @concept = Concept.new scrub_parameters
    @concept.save
    redirect_to @concept
  end

private
  def scrub_parameters
    params.require(:concept).permit(:title, :description, :content)
  end
end
