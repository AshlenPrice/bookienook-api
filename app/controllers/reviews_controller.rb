# frozen_string_literal: true
class ReviewsController < OpenReadController
  before_action :set_review, only: [:show, :update, :destroy]

  # GET /reviews
  def index
    @reviews = Review.all

    render json: @reviews
  end

  # GET /reviews/1
  def show
    render json: Review.find(params[:id])
  end

  # POST /reviews - need to add user to this. Only a user can create
  def create

    @review = current_user.reviews.build(review_params)

    if @review.save
      render json: @review, status: :created
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reviews/1
  def update
    if @review.update(review_params)
      render json: @review
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reviews/1
  def destroy
    @review.destroy

    head :no_content
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_review
    @review = current_user.reviews.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def review_params
    print params
    params.require(:review).permit(:review_content, :book_id)
  end
  private :set_review, :review_params
end
