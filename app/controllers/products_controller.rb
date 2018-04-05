class ProductsController < ApplicationController
	
  	def index
	  	@products = Product.all
	  	@contact = Contact.new
  	end

  	def mount_uploader
  	
  	end

    
end
