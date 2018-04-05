class ContactsController < ApplicationController
	  def new
	  	@contact = Contact.new
	  end

	  def create
	  	@contact = Contact.new(params[:contact])
	  	@contact.request = request
	  	if @contact.deliver
	  	else
	  		flash.now[:error] = "No fue posible enviar tú correo"
	  		
	  	end
	  end
end
