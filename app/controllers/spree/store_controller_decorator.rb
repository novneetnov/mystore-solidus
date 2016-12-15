module Spree
  class StoreController < Spree::BaseController
		before_action :set_order
		def set_order
			@order = current_order || Order.incomplete.find_or_initialize_by(guest_token: cookies.signed[:guest_token])
			associate_user
		end
	end
end

