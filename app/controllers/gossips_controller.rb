
class GossipsController < ApplicationController
	
	def index
		search = params[:query].present? ? params[:query] : nil
		@gossips = if search 
			Gossip.search(search)
		else 
			Gossip.all
		end
	end


	def autocomplete
		render json: Gossip.search(params[:query], {
			fields: ["content"],
			limit: 10,
			autocomplete: true,
			}).map(&:content)
	end
	
	def new
		@gossip = Gossip.new 
	end
	
	def create
		@gossip = Gossip.new(gossip_params)
		@gossip.user = current_user
		@gossip.save
		redirect_to gossips_path
	end

	def show
		@gossip = Gossip.find(params[:id])
	end

	def edit
		@gossip = Gossip.find(params[:id])
	end

	def update
		@gossip = Gossip.find(params[:id])
		if @gossip.update(gossip_params)
			redirect_to @gossip
		else 
			render 'edit'
		end
	end

	def destroy
		@gossip = Gossip.find(params[:id])
		if @gossip.user == current_user
			@gossip.destroy
			redirect_to gossips_path
		else flash[:error] = "Vous ne pouvez pas supprimer ce gossip"
			redirect_to gossips_path
		end
	end

	private
 		def gossip_params
    	params.permit(:anonymous_author, :content)
  	end

end
