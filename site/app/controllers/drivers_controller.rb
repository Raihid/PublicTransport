class DriversController < ApplicationController
    def index
        drivers_sql = "SELECT drivers.*, GROUP_CONCAT(permissions.full_title SEPARATOR ', ') AS full_title FROM drivers
                        LEFT JOIN driver_permissions ON drivers.id = driver_permissions.driver
                        LEFT JOIN permissions ON driver_permissions.permission = permissions.id
                        GROUP BY drivers.id"
                            
        @drivers = ActiveRecord::Base.connection.select_all(drivers_sql).to_hash
    end
    def search
        drivers_sql = "SELECT COUNT(drivers.id) as drivers_num, drivers.*, GROUP_CONCAT(permissions.full_title SEPARATOR ', ') AS full_title FROM drivers
                        LEFT JOIN driver_permissions ON drivers.id = driver_permissions.driver
                        LEFT JOIN permissions ON driver_permissions.permission = permissions.id
                        WHERE drivers.name LIKE '%#{params[:name]}%'
                        GROUP BY drivers.id"
        @drivers = ActiveRecord::Base.connection.select_all(drivers_sql).to_hash
        count_sql = "SELECT COUNT(*) AS num FROM (#{drivers_sql}) t1" 
        @count = ActiveRecord::Base.connection.select_all(count_sql).to_hash[0]["num"]

    end
end
