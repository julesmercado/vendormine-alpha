class SuppliersController < ApplicationController
	before_action :authenticate_user, only: [:index]
	before_action :save_login_state, only: [:login, :login_attempt]

	def index
		@supplier = Supplier.find(current_user)
		@supply = @supplier.supplies
	end

	def new
		@supplier = Supplier.new
	end

	def create
		@supplier = Supplier.new(supplier_params)

		respond_to do |format|
			if @supplier.save
				format.html { redirect_to @supplier, notice: 'Successfully Created!' }
				format.js
			else
				puts "***you are here******"
				format.html { render 'new' }
				format.js
			end
		end
	end

	def login
	end

	def login_attempt
		supplier = Supplier.find_by_supplier_email(params[:supplier][:login_email])

		respond_to do |format|
		    if supplier && supplier.authenticate(params[:supplier][:login_password])
		      session[:user_id] = supplier.id
		      format.html { redirect_to suppliers_url }
		      #format.js { render json: supplier, status: :ok }
		    else
		      format.html { render 'login', notice: 'Invalid email/password combination' }
		      format.js
		    end
		end
	end

	def get_pricing_model
		pricing = Pricing.all

		respond_to do |format|
			if pricing
				format.js { render json: pricing, status: :ok }
			end
		end
	end

	def get_session_user
		session_user = Supplier.find(current_user)

		respond_to do |format|
			if session_user
				format.js { render json: session_user, status: :ok }
			end
		end
	end

	def logout
		session[:user_id] = nil
		redirect_to login_suppliers_url
	end

	private

	def supplier_params
		params.require(:supplier).permit(:supplier_name, :supplier_desc, :supplier_address, :supplier_contact_no, :supplier_email, :password, :avatar)
	end
end
