class PagesController < ApplicationController
    before_action :load_areas
    before_action :load_apartments

    def home
        @featured_apartments = Apartment.where(published: true, in_evidence: true).order(created_at: :desc)
    end

    def about
    end

    def owners
        @questions = Question.with_translations(I18n.locale).order(created_at: :desc)
    end
end
