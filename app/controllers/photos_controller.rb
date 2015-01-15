class PhotosController < ApplicationController
	def new
		@photo = Photo.new
	end

	def create
	    @clearance = Photo.create(clearance_params)
  	end

  	 def edit
	    @clearance = Clearance.find(params[:id])
	 end

	  def update
	    @clearance = Clearance.find(params[:id])
	    if @clearance.update_attributes(params[:clearance])
	      redirect_to clearances_url, notice: "Clearance was successfully updated."
	    else
	      render :edit
	    end
	  end

	  def destroy
	    @clearance = Clearance.find(params[:id])
	    @clearance.destroy
	    redirect_to clearances_url, notice: "Clearance was successfully destroyed."
	  end
end
