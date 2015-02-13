class ReviewsController < ApplicationController
  @@review_reward = 1
  @@approval_bonus = 2
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: :show
  before_action :set_concept
  before_action :earn_credit!, only: :create

  def show
  end

  def new
    @review = @concept.reviews.new
    @review.user = current_user
  end

  def edit
    @review = Review.find(params[:id])
  end

  def create
    @review = @concept.reviews.new review_params
    @review.user = current_user

    if @review.save
      redirect_to concept_path(@concept), notice: 'Review was successfully created.'
    else
      render :new
    end
  end

  def update
    if @review.update(review_params)
      redirect_to concept_path(@concept), notice: 'Review was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to concept_path(@concept), notice: 'Review was successfully destroyed.'
  end

  private

    def set_concept
      @concept = Concept.find params[:concept_id]
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    def earn_credit!
      current_user.credit += @@review_reward
      current_user.save
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:content)
    end
end
