class PagesController < ApplicationController
    def home
        @areas = Area.all
        @featured_apartments = Apartment.where(in_evidence: true).order(created_at: :desc)
    end

    def owner
        
    end
end
