module Spree
  class HomeController < Spree::StoreController
    helper 'spree/products'
    respond_to :html

    def index
      @searcher = build_searcher(params.merge(include_images: true))
      @products = @searcher.retrieve_products
			@new_arrivals = @products.where("meta_keywords like ?", "new_arrival")
    end

		def fast_view
			@product = Spree::Product.find(params[:id])	
			respond_to do |format|
				#render partial: "spree/products/fast_view", locals: { product: product }
				format.html { render partial: "spree/products/fast_view", locals: { product: @product } }
				#format.js { }
			end
		end
  end
end
