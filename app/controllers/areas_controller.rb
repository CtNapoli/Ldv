class AreasController < ApplicationController
    before_action :load_areas
    before_action :load_apartments

    def show
        @area = Area.friendly.find(params[:id])
        @paragraphs = JSON.parse @area.content
    end
end
