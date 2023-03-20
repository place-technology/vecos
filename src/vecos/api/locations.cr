module Vecos
  module API
    class Locations
      def initialize(@session : Session)
      end

      def get(location_id : String)
        JSON.parse(@session.get("/api/locations/#{location_id}").body)
      end

      def list(page_number : Int32 = 1, page_size : Int32 = 10)
        io = IO::Memory.new
        builder = ParameterBuilder.new(io)

        builder.add("pageNumber", page_number)
        builder.add("pageSize", page_size)

        JSON.parse(@session.get("/api/locations?#{io.rewind}").body)
      end

      def create(name : String)
        JSON.parse(@session.post("/api/locations", raw: {"Name" => name}.to_json).body)
      end

      def update(location_id : String, name : String)
        JSON.parse(@session.put("/api/locations/#{location_id}", raw: {"Name" => name}.to_json).body)
      end

      def delete(location_id : String, name : String)
        JSON.parse(@session.delete("/api/locations/#{location_id}").body)
      end

      def list_sections(location_id : String, page_number : Int32 = 1, page_size : Int32 = 10)
        io = IO::Memory.new
        builder = ParameterBuilder.new(io)

        builder.add("pageNumber", page_number)
        builder.add("pageSize", page_size)

        JSON.parse(@session.delete("/api/locations/#{location_id}/sections?#{io.rewind}").body)
      end
    end
  end
end
