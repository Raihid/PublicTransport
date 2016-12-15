class StopsController < ApplicationController
    def index
        @stops = Stop.all
    end
    def show
        @stop = Stop.find(params[:id])
        lines_sql = "SELECT stops.*, `lines`.* FROM stops 
                 INNER JOIN lines_stops ON stops.id = lines_stops.stop_id
                 INNER JOIN `lines` ON `lines`.id = lines_stops.line_id
                 WHERE stops.id = #{params[:id]}"
        lines_records = ActiveRecord::Base.connection.exec_query(lines_sql)
        @lines = lines_records.to_hash
        departures_sql = "SELECT route_parts.*, `lines`.* FROM lines_stops
                     INNER JOIN route_parts ON route_parts.stop_order = lines_stops.order_no
                     INNER JOIN departures ON departures.id = route_parts.departure
                     INNER JOIN `lines` ON `lines`.id = departures.line
                     WHERE lines_stops.stop_id = #{params[:id]} AND departures.line = lines_stops.line_id
                     ORDER BY route_parts.hour ASC LIMIT 0,10"
        departures_records = ActiveRecord::Base.connection.exec_query(departures_sql)
        @departures = departures_records.to_hash
    end
end
