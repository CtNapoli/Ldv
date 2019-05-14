class ApartmentsController < ApplicationController
    def index 
        if params[:where] || params[:guests]
            @where = Area.where("name ILIKE ?", "%#{params[:where]}%").first
            @guests = params[:guests].to_i

            @apartments = Apartment.where(area_id: @where).where('capacity >= ?', @guests).where(published: true)
        else
            @apartments = Apartment.where(published: true)
        end

        respond_to do |format|
            format.html
            format.js
        end
    end

    def show
        @apartment = Apartment.friendly.find(params[:id])
        @paragraphs = JSON.parse @apartment.content
    end
end
