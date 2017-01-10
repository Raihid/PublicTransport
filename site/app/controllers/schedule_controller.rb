class ScheduleController < ApplicationController
  def index
      @count = ActiveRecord::Base.connection.exec_query("SELECT COUNT(*) as num FROM route_parts").to_hash[0]["num"]
  end

  def advanced
        lines_sql = "SELECT `lines`.*, first_stop.name as first_stop_name,
                  last_stop.name as last_stop_name FROM `lines`
                  LEFT JOIN stops as first_stop ON `lines`.first_stop = first_stop.id
                  LEFT JOIN stops as last_stop ON `lines`.last_stop = last_stop.id"
        lines_hash = ActiveRecord::Base.connection.exec_query(lines_sql).to_hash
        @lines_options = [["Dowolna", ""]]
        lines_hash.each do |line|
            @lines_options += [["#{line["number"]} - #{line["first_stop_name"]} => #{line["last_stop_name"]}", line["id"]]]
        end
        
        stops_sql = "SELECT * FROM stops"
        stops_hash = ActiveRecord::Base.connection.exec_query(stops_sql).to_hash
        @stop_options = [["Dowolny", ""]]
        stops_hash.each do |stop|
            @stop_options += [[stop["name"], stop["id"]]]
        end

        @hour_options = []
        @min_options = []
        (0..23).each { |n| @hour_options += [[n.to_s.rjust(2, "0"), n.to_s.rjust(2, "0")]] }
        (0..11).each { |n| @min_options += [[(n*5).to_s.rjust(2, "0"), (n*5).to_s.rjust(2, "0") + ":00" ]] } 
  end

  def results
      data = params["schedule"]
      query = "SELECT * FROM route_parts 
               LEFT JOIN departures ON route_parts.departure = departures.id
               LEFT JOIN `lines` ON departures.line = `lines`.id
               LEFT JOIN lines_stops ON (`lines`.id = lines_stops.line_id AND 
              lines_stops.order_no = route_parts.stop_order)
               LEFT JOIN stops ON stops.id = lines_stops.stop_id WHERE " 
      if data["stop"] != "" 
         query += "stops.id = #{data["stop"]} AND "
      end
      if data["line"] != ""
         query += "`lines`.id = #{data["line"]} AND "
      end
      before = data["depart_before_h"] + ":" + data["depart_before_m"]
      after = data["depart_after_h"] + ":" + data["depart_after_m"]
      query += "route_parts.hour BETWEEN \"#{after}\" AND \"#{before}\""
      @results = ActiveRecord::Base.connection.exec_query(query).to_hash

      
        
  end
end
