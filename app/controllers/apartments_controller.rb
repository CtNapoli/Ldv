class ApartmentsController < ApplicationController
    before_action :load_areas, only: [:index, :show]
    before_action :load_apartments, only: [:show]
    before_action :load_apartment, only: [:show, :block_private_apartment]
    before_action :block_private_apartment, only: [:show]
    
    def index 
        if params[:where] || params[:guests]
            @where = Area.with_translations(I18n.locale).where("cast(area_translations as text) ilike ?", "%#{params[:where]}%").last
            @guests = params[:guests].to_i

            @apartments = Apartment.with_translations(I18n.locale).includes(:reservations).where(area_id: @where, published: true).order('created_at desc').distinct

            if params[:start] && params[:end]
                @start = params[:start].to_date
                @end = params[:end].to_date
                @apartments = @apartments.reject {|a| a.busy_in_this_range?(@start, @end)}
            end
        else
            @apartments = Apartment.with_translations(I18n.locale).where(published: true).order('created_at desc').distinct
        end

        respond_to do |format|
            format.html
            format.js
        end
    end

    def show
        @apartment = Apartment.friendly.find(params[:id])
        @paragraphs = JSON.parse @apartment.content
        @guests_limit = @apartment.capacity

        days = @apartment.reservations.where(status: 'confirmed').select{|a| a.date_start.present?}

        @busy_days = []
        days.each do |range|
            while range.date_start <= range.date_end
                @busy_days.push(range.date_start.strftime("%FT%T"))
                range.date_start += 1.day
            end
        end
        
        @prices = @apartment.prices.map{|p| {start: p.start, end: p.end, price: p.value}}.to_json
    end

    def block_private_apartment
        redirect_to apartments_path unless @apartment.published?
    end

    def load_apartment
        @apartment = Apartment.friendly.find(params[:id])
    end
end
