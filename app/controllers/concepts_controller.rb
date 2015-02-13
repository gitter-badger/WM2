class ConceptsController < ApplicationController
  @@concept_cost = 3

  before_action :authenticate_user!, except: [:show, :index]
  before_action :validate_credit, only: :new
  before_action :spend_credit!, only: :create

  def index
    @concepts = Concept.all
  end

  def show
    @concept = Concept.find params[:id]
  end

  def new
    @concept = current_user.concepts.new
  end

  def edit
    @concept = Concept.find params[:id]
  end

  def create
    @concept = current_user.concepts.new scrub_parameters

    if @concept.save
      redirect_to concept_path(@concept), notice: 'Concept was successfully created.'
    else
      render :new
    end
  end

  def update
    @concept = Concept.find params[:id]

    if @concept.update(scrub_parameters)
      redirect_to concept_path(@concept), notice: 'Concept was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @concept = Concept.find params[:id]
    @concept.destroy
    redirect_to concepts_path
  end

private
  def validate_credit
    credit = current_user.credit
    if credit < @@concept_cost
      redirect_to concepts_path, notice: "Not enough credit! You have #{credit} and need #{@@concept_cost}."
    end
  end

  def spend_credit!
    current_user.credit -= @@concept_cost
  end

  def scrub_parameters
    params.require(:concept).permit(:title, :description, :content)
  end
end
