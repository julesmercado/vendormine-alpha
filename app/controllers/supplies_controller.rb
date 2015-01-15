class SuppliesController < ApplicationController

	def new
		@supplier = Supplier.find(params[:supplier_id])
		@supply = Supply.new
		supplies = @supplier.supplies

		respond_to do |format|
			if supplies
				format.js { render json: supplies, status: :ok}
			end
		end
	end

	def create
		@supplier = Supplier.find(params[:supplier_id])
		@supply = @supplier.supplies.new(supply_params)

		respond_to do |format|
			if @supply.save
				format.html { redirect_to suppliers_url, notice: "New Supply Created! "}
				format.js
			else
				format.html { render 'new' }
				format.js
			end
		end
	end

	private

	def supply_params
		params.require(:supply).permit(:supply_name, :pricing, :supply_price, :supply_desc)
	end
end
