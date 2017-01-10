class VehiclesController < ApplicationController
    def index
        vehicles_sql = "SELECT vehicles.*, vehicle_variant.name AS variant, 
                        vehicle_condition.description AS vcondition, vehicle_condition.score AS score 
                        FROM vehicles LEFT JOIN vehicle_variant ON vehicle_variant.id = vehicles.variant 
                        LEFT JOIN vehicle_condition ON vehicle_condition.id = vehicles.cond"
        @vehicles = ActiveRecord::Base.connection.exec_query(vehicles_sql).to_hash
        average_sql = "SELECT AVG(vehicle_condition.score) as average FROM vehicles
                       LEFT JOIN vehicle_condition ON vehicle_condition.id = vehicles.cond"
        @average = ActiveRecord::Base.connection.exec_query(average_sql).to_hash[0]["average"]
        @count = ActiveRecord::Base.connection.exec_query("SELECT COUNT(*) as num FROM vehicles").to_hash[0]["num"]
    end
    def search
         
    end
end
