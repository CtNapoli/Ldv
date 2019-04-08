class AreasController < ApplicationController
    def show
        @area = Area.friendly.find(params[:id])
        @paragraphs = JSON.parse @area.content
    end
end
