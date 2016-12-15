class LinesController < ApplicationController
    def index
        sql = "SELECT `lines`.*, first_stop_record.name first_stop_name, last_stop_record.name last_stop_name
        FROM `lines` INNER JOIN stops first_stop_record ON first_stop_record.id = `lines`.first_stop
        INNER JOIN stops last_stop_record ON last_stop_record.id = `lines`.last_stop "
        @lines = ActiveRecord::Base.connection.select_all(sql).to_hash
    end

    def new
    end

    def create
    end

    def show
        @line = Line.find(params[:id])
        stops_sql = "SELECT `lines`.*, stops.* FROM `lines`
                 INNER JOIN lines_stops ON `lines`.id = lines_stops.line_id
                 INNER JOIN stops ON stops.id = lines_stops.stop_id
                 WHERE `lines`.id = #{params[:id]}"
        stop_records = ActiveRecord::Base.connection.exec_query(stops_sql)
        @stops = stop_records.to_hash
    end

    def schedule
        @line = Line.find(params[:line_id])
        @stop = Stop.find(params[:id])
        departures_sql = "SELECT lines_stops.*, route_parts.* FROM lines_stops
                     INNER JOIN route_parts ON route_parts.stop_order = lines_stops.order_no
                     INNER JOIN departures ON departures.id = route_parts.departure
                     WHERE lines_stops.stop_id = #{params[:id]} AND lines_stops.line_id = #{params[:line_id]}
                     AND departures.line = #{params[:line_id]}"
        
        departures_records = ActiveRecord::Base.connection.exec_query(departures_sql)
        @departures = departures_records.to_hash
    end


end
