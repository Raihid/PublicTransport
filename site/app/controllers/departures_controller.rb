class DeparturesController < ApplicationController
    def index
        departures_sql = "SELECT * FROM departures"
        @departures = ActiveRecord::Base.connection.exec_query(departures_sql).to_hash
    end

    def new
        stops_sql = "SELECT * FROM stops INNER JOIN lines_stops ON stops.id = lines_stops.stop_id WHERE lines_stops.line_id = #{params[:line]}"
        @stops = ActiveRecord::Base.connection.exec_query(stops_sql).to_hash
        drivers_sql = "SELECT * FROM drivers"
        drivers_hash = ActiveRecord::Base.connection.exec_query(drivers_sql).to_hash
        @drivers_options = []
        drivers_hash.each do |driver|
            @drivers_options += [[driver["name"], driver["id"]]]
        end

        vehicles_sql = "SELECT vehicles.*, vehicle_variant.name FROM vehicles 
                        LEFT JOIN vehicle_variant ON vehicles.variant = vehicle_variant.id"
        vehicles_hash = ActiveRecord::Base.connection.exec_query(vehicles_sql).to_hash
        @vehicles_options = []
        vehicles_hash.each do |vehicle|
            @vehicles_options += [[vehicle["name"] + " " + vehicle["registration_number"], vehicle["id"]]]
        end

        @hour_options = []
        @min_options = []
        (0..23).each { |n| @hour_options += [[n.to_s.rjust(2, "0"), n.to_s.rjust(2, "0")]] }
        (0..11).each { |n| @min_options += [[(n*5).to_s.rjust(2, "0"), (n*5).to_s.rjust(2, "0")]] } 


        line_sql = "SELECT * FROM `lines` WHERE `lines`.id = #{params["line"]}"
        @line = ActiveRecord::Base.connection.exec_query(line_sql).to_hash[0]

    end

    def pickline
        lines_sql = "SELECT `lines`.*, first_stop_record.name first_stop_name, last_stop_record.name last_stop_name
        FROM `lines` INNER JOIN stops first_stop_record ON first_stop_record.id = `lines`.first_stop
        INNER JOIN stops last_stop_record ON last_stop_record.id = `lines`.last_stop "
        @lines = ActiveRecord::Base.connection.exec_query(lines_sql).to_hash
    end

    def create
        data = params["departure"]
        arrival = data["depart"].max_by { |k, v| v["hour"]*24  + v["min"] }[0]
        arrival_hour = "\"#{data["depart"][arrival]["hour"]}:#{data["depart"][arrival]["min"]}:00\""
        ActiveRecord::Base.connection.exec_query("START TRANSACTION;")
        insert_sql = "INSERT INTO departures(departure_hour, arrival_hour, day, line, vehicle, driver)
                VALUES (\"#{data["departure_hour_h"]}:#{data["departure_hour_m"]}\", #{arrival_hour}, 
                1, #{data["line"]}, #{data["vehicle"]}, #{data["driver"]});"
        departure_id = ActiveRecord::Base.connection.insert(insert_sql)
        sql = ""
        data["depart"].each do |stop, depart|
            time = "\"#{depart["hour"]}:#{depart["min"]}:00\""
            sql = "INSERT INTO route_parts(departure, hour, stop_order) VALUES (#{departure_id}, #{time}, #{stop}); "
            ActiveRecord::Base.connection.exec_query(sql)
        end
         
        sql = "COMMIT;"
        ActiveRecord::Base.connection.exec_query(sql)
        @line = data["line"]
    end
end
