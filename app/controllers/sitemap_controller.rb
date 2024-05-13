class SitemapController < ApplicationController

    def show
        @apartment = Apartment.where(published: true)
        respond_to do |format|
            format.xml
        end
    end
  
end