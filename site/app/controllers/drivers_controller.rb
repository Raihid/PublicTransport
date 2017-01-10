class DriversController < ApplicationController
    def index
        drivers_sql = "SELECT  drivers.*, COUNT(drivers.id) as drivers_num, GROUP_CONCAT(permissions.full_title SEPARATOR ', ') AS full_title FROM drivers
                        LEFT JOIN driver_permissions ON drivers.id = driver_permissions.driver
                        LEFT JOIN permissions ON driver_permissions.permission = permissions.id
                        GROUP BY drivers.id"
                            
        count_sql = "SELECT COUNT(*) as drivers_num FROM drivers"
        @drivers = ActiveRecord::Base.connection.select_all(drivers_sql).to_hash
        @count = ActiveRecord::Base.connection.select_all(count_sql).to_hash[0]["drivers_num"]
    end
    def search
        age_min = (params.has_key?(:age_min) and params[:age_min] != "") ? params[:age_min] : 0
        age_max = (params.has_key?(:age_max) and params[:age_max] != "") ? params[:age_max] : 999
        drivers_sql = "SELECT COUNT(drivers.id) as drivers_num, drivers.*, GROUP_CONCAT(permissions.full_title SEPARATOR ', ') AS full_title FROM drivers
                        LEFT JOIN driver_permissions ON drivers.id = driver_permissions.driver
                        LEFT JOIN permissions ON driver_permissions.permission = permissions.id
                        WHERE drivers.name LIKE '%#{params[:name]}%'
                        AND drivers.age BETWEEN #{age_min} and #{age_max}
                        GROUP BY drivers.id"
        @drivers = ActiveRecord::Base.connection.select_all(drivers_sql).to_hash
        count_sql = "SELECT COUNT(*) AS num FROM (#{drivers_sql}) t1" 
        @count = ActiveRecord::Base.connection.select_all(count_sql).to_hash[0]["num"]

    end
    def new
        permission_sql = "SELECT * FROM permissions"
        permission_hash = ActiveRecord::Base.connection.select_all(permission_sql).to_hash
        @permission_options = []
        permission_hash.each do |permission|
            @permission_options += [["Dokument #{permission["required_document"]} pozwala na #{permission["full_title"]}", permission["id"]]]
        end
    end

    def create
        ActiveRecord::Base.connection.exec_query("START TRANSACTION;")
        driver = params["driver"]
        driver_sql = "INSERT INTO drivers(name, age, pesel) VALUES (\"#{driver["name"]}\", #{driver["age"]}, \"#{driver["pesel"]}\")"
        driver_id = ActiveRecord::Base.connection.insert(driver_sql)
        params["permissions"].each do |permission|
            permission_sql = "INSERT INTO driver_permissions(driver, permission) VALUES (#{driver_id}, #{permission})"
        end
        ActiveRecord::Base.connection.exec_query("COMMIT;")
        
        
    end
end
