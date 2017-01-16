class DifficultiesController < ApplicationController
    def new
        lines_sql = "SELECT `lines`.*, first_stop.name as first_stop_name,
                  last_stop.name as last_stop_name FROM `lines`
                  LEFT JOIN stops as first_stop ON `lines`.first_stop = first_stop.id
                  LEFT JOIN stops as last_stop ON `lines`.last_stop = last_stop.id"
        lines_hash = ActiveRecord::Base.connection.exec_query(lines_sql).to_hash
        @lines_options = []
        lines_hash.each do |line|
            @lines_options += [["#{line["number"]} - #{line["first_stop_name"]} => #{line["last_stop_name"]}", line["id"]]]
        end
        diff_types_sql = "SELECT difficulty_type.* FROM difficulty_type"
        diff_types_hash = ActiveRecord::Base.connection.exec_query(diff_types_sql).to_hash
        @diff_types_options = []
        diff_types_hash.each do |type|
            @diff_types_options += [[type["name"], type["id"]]]
        end
    end
    def create
        @difficulty = Difficulty.new(params[:difficulty].permit(:title, :description, :line, :diff_type))
        @difficulty.save
        # BEGIN TRANSACTION; 
        # INSERT INTO difficulties(description, line) VALUES (:description, :line); 
        # END TRANSACTION;
        redirect_to difficulty_path(@difficulty)

    end
    def index
        difficulties_sql = "SELECT difficulties.*, `lines`.number FROM difficulties
                            LEFT JOIN `lines` ON difficulties.line = `lines`.id"
        @difficulties = ActiveRecord::Base.connection.exec_query(difficulties_sql).to_hash
        count_sql = "SELECT COUNT(*) FROM difficulties"
        @count = ActiveRecord::Base.connection.exec_query(count_sql).to_hash[0]["COUNT(*)"]
    end
    def show
        difficulty_sql = "SELECT difficulties.*, `lines`.number,
                          difficulty_type.name as difficulty_name, difficulty_repairman.* 
                          FROM difficulties
                          LEFT JOIN `lines` ON difficulties.line = `lines`.id
                          LEFT JOIN difficulty_type ON difficulties.diff_type = difficulty_type.id
                          LEFT JOIN difficulty_repairman ON difficulty_type.repairman = difficulty_repairman.id
                          WHERE difficulties.id = #{params[:id]}"
        @difficulty = ActiveRecord::Base.connection.exec_query(difficulty_sql).to_hash[0]

    end
    def search
        query_sql = "SELECT * FROM difficulties WHERE MATCH(title,description) AGAINST('#{params["q"]}')"
        @results = ActiveRecord::Base.connection.exec_query(query_sql).to_hash
        @count = @results.length

    end
end
