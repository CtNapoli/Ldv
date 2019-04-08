class ApartmentsController < ApplicationController
    def index
        if params[:where] || params[:guests]
            @apartments = Apartment.where(area_id: params[:where].to_i).where('capacity >= ?',  params[:guests].to_i).where(published: true)
        else
            @apartments = Apartment.where(published: true)
        end

        respond_to do |format|
            format.html
            format.js
        end
    end

    def show
        @apartment = Apartment.find(params[:id])

        @paragraphs = JSON.parse @apartment.content

    end
end
