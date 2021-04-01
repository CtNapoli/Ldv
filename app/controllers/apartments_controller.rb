class ApartmentsController < ApplicationController
    before_action :load_areas, only: [:index, :show, :special_offer]
    before_action :load_apartments, only: [:show, :special_offer]
    before_action :load_apartment, only: [:show, :block_private_apartment]
    before_action :block_private_apartment, only: [:show]
    
    def index
        @where = params[:where].to_i
        @guests = params[:guests].to_i

        #@apartments = Apartment.with_translations(I18n.locale).where(published: true).order('updated_at DESC')
        @apartments = Apartment.where(published: true).order('updated_at DESC')

        @apartments = @apartments.where(area_id: @where).distinct if params[:where].present?
        @apartments = @apartments.where("capacity >= ?", params[:guests]) if params[:guests].present?

        if params[:start] && params[:end]
            @start = params[:start].to_date
            @end = params[:end].to_date
            @apartments = @apartments.reject {|a| a.busy_in_this_range?(@start, @end)}
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
    rescue ActiveRecord::RecordNotFound => e
        render '404.html', status: 404
    end

    def special_offer
        @where = params[:where].to_i
        @guests = params[:guests].to_i

        #mostra un unico appartamento
        @apartments = Apartment.where(published: true).includes(:prices).references(:prices) 
        .where("prices.price_offer_start IS not NULL and extract(epoch from prices.price_offer_start) > ?", Time.now.to_i)
        .order('price_offer_start ASC')

        #mostra più appartamenti
        #@apartments = Apartment.where(published: true).joins(:prices)
        #.where("prices.price_offer_start IS not NULL and extract(epoch from prices.price_offer_start) > ?", Time.now.to_i)
        #.order('price_offer_start ASC')

        # @price = Price.includes(:apartment).references(:apartment)
        # .where("prices.price_offer_start IS not NULL and extract(epoch from prices.price_offer_start) > ?", Time.now.to_i)
        # .order('price_offer_start ASC')

        @apartments = @apartments.where(area_id: @where).distinct if params[:where].present?
        @apartments = @apartments.where("capacity >= ?", params[:guests]) if params[:guests].present?

        if params[:price_offer_start] && params[:price_offer_end]
            @start = params[:price_offer_start].to_date
            @end = params[:price_offer_end].to_date
            @apartments = @apartments.reject {|a| a.busy_in_this_range?(@start, @end)}
        end

        respond_to do |format|
            format.html
            format.js
        end
    end
end
