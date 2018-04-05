ActiveAdmin.register Product do

permit_params :name, :photo, :price


form do |f|
		  inputs 'Agregando un nuevo producto' do
		  f.input :name
		  f.file_field :photo, required: true, as: :file
		  f.input :price
		end 
		actions
	end

end
