class ApartmentsController < ApplicationController
    before_action :load_areas, only: [:index, :show]
    before_action :load_apartments, only: [:show]
    
    def index 
        if params[:where] || params[:guests]
            @where = Area.where("name ILIKE ?", "%#{params[:where]}%").first
            @guests = params[:guests].to_i

            @apartments = Apartment.where(area_id: @where).where('capacity >= ?', @guests).where(published: true)
        else
            @apartments = Apartment.where(published: true)
        end

        @start_date = params[:date] || Date.current
        @date_range = (@start_date.to_date.beginning_of_month..@start_date.to_date.end_of_month).to_a

        respond_to do |format|
            format.html
            format.js
        end
    end

    def show
        @apartment = Apartment.friendly.find(params[:id])
        @paragraphs = JSON.parse @apartment.content
    end

    def select_day
        
    
        respond_to do |format|
          format.js
        end
    end
end
