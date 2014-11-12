class CategoriesController < ApplicationController

	def show
		@category = Category.find(params[:id])
	end

	def new
		@category = Category.new

	end

	def create
		@category = Category.new(category_params)
		if @category.save
			redirect_to products_path
		else
			render :new
		end
	end

	def destroy
		@category = Category.find(params[:id])
		@category.destroy
		redirect_to products_path
	end

	private
	def category_params
		params.require(:category).permit(:name)
	end

end
