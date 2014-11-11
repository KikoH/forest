class ReviewsController < ApplicationController
  before_filter :load_product# :ensure_logged_in, only: [:create, :destroy]
  before_filter :load_review, only: [:show, :edit, :destroy, :update]

  def show
  end

  def edit
  end

  def update
    @review.update_attributes(review_params)
    if @review.save
      redirect_to @review
    else
      render :edit
    end
  end

  def create
  	@review = @product.reviews.build(review_params)
  	@review.user = current_user

  	if @review.save
  		redirect_to products_path, notice: 'Review created successfully'
  	else
  		render 'products/show'
  	end
  end

  def destroy
  	@review.destroy
    redirect_to products_path
  end

  private
  def review_params
  	params.require(:review).permit(:comment, :product_id)
  end

  def load_product
  	@product = Product.find(params[:product_id])
  end

  def load_review
    @review = @product.reviews.find(params[:id])
  end

end
