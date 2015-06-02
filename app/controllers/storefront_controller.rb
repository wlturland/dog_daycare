class StorefrontController < ApplicationController
  def all_items
  	if params[:cat_id]
  		@category = Category.find(params[:cat_id])
  		@products = Product.where(category_id: params[:cat_id])
	else
  		@products = Product.all
  	end
  end
end
# TODO: Add logic to handle when there is no inventory in the category 
# Essentially, return all products and categories with empty category notice