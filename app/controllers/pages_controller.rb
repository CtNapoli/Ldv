class PagesController < ApplicationController
    before_action :load_areas
    before_action :load_apartments

    def home
        @featured_apartments = Apartment.where(in_evidence: true).order(created_at: :desc)
    end

    def owners
        @questions = Question.order(created_at: :desc)
    end

    def load_areas
        @areas = Area.all
    end

    def load_apartments
        @apartments = Apartment.all
    end
end
