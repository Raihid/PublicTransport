class LinesController < ApplicationController
    def index 
        sql = "SELECT `lines`.*, first_stop_record.name first_stop_name, last_stop_record.name last_stop_name
        FROM `lines` INNER JOIN stops first_stop_record ON first_stop_record.id = `lines`.first_stop
        INNER JOIN stops last_stop_record ON last_stop_record.id = `lines`.last_stop"
        @lines = ActiveRecord::Base.connection.select_all(sql).to_hash
    end

    def new
    end

    def create
    end

    def show
        @line = Line.find(params[:id])
    end
end
