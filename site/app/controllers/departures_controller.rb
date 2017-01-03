class DeparturesController < ApplicationController
    def index
        departures_sql = "SELECT * FROM departures"
        @departures = ActiveRecord::Base.connection.exec_query(departures_sql).to_hash
    end

    def new
        stops_sql = "SELECT * FROM stops INNER JOIN lines_stops ON stops.id = lines_stops.stop_id WHERE lines_stops.line_id = #{params[:line]}"
        @stops = ActiveRecord::Base.connection.exec_query(stops_sql).to_hash
    end

    def pickline
        lines_sql = "SELECT `lines`.*, first_stop_record.name first_stop_name, last_stop_record.name last_stop_name
        FROM `lines` INNER JOIN stops first_stop_record ON first_stop_record.id = `lines`.first_stop
        INNER JOIN stops last_stop_record ON last_stop_record.id = `lines`.last_stop "
        @lines = ActiveRecord::Base.connection.exec_query(lines_sql).to_hash
    end

    def create
        departure_sql = "INSERT INTO departures VALUES()"  
        @departures = ActiveRecord::Base.connection.select_all(sql).to_hash
    end
end
