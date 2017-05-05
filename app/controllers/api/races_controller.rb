module Api
	class RacesController < ApplicationController
		protect_from_forgery with: :null_session

		rescue_from Mongoid::Errors::DocumentNotFound do |exception|
			render plain: "woops: cannot find race[#{params[:id]}]", status: :not_found
		end

		def index
			if !request.accept || request.accept == "*/*"
				render plain: "/api/races, offset=[#{params[:offset]}], limit=[#{params[:limit]}]" 
			else
			  
			end 
		end

		def show
			if !request.accept || request.accept == "*/*"
				render plain: "/api/races/#{params[:id]}" 
			else
			    race = Race.find(params[:id])
			    render json: race
			end 
		end

		def create
			if !request.accept || request.accept == "*/*"
				render plain: "#{params[:race][:name]}", status: :ok
			else
				race = Race.create(race_params)
				render plain: "#{race.name}", status: :created
			end
		end

		def update

			race = Race.find(params[:id])
			race.update(race_params)
			race.save

			render json: race, status: :ok
		end

		def destroy

			race = Race.find(params[:id])
			race.delete

			render :nothing=>true, :status => :no_content
		end

		private
		  def race_params
		  	params.require(:race).permit(:name, :date)
		  end
	end
end