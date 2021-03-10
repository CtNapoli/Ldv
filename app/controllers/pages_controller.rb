class PagesController < ApplicationController
    before_action :load_areas
    before_action :load_apartments

    def home
        @featured_apartments = Apartment.where(published: true, in_evidence: true).order('updated_at DESC').first(6)

        @apartment_offer = Apartment.where(published: true).includes(:prices).references(:prices)
        .where("prices.price_offer_start IS not NULL and extract(epoch from prices.price_offer_end) > ?", Time.now.to_i)
        .order('RANDOM()')

        #@apartment_offer = Apartment.where(published: true).includes(:prices).where.not(prices: nil)
    end

    def about
    end

    def owners
        @questions = Question.with_translations(I18n.locale).order(created_at: :desc)
    end
end
