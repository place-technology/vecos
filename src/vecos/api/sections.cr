module Vecos
  module API
    class Sections
      def initialize(@session : Session)
      end

      def get(section_id : String)
        JSON.parse(@session.get("/api/sections/#{section_id}").body)
      end

      def list(page_number : Int32 = 1, page_size : Int32 = 10)
        io = IO::Memory.new
        builder = ParameterBuilder.new(io)

        builder.add("pageNumber", page_number)
        builder.add("pageSize", page_size)

        JSON.parse(@session.get("/api/sections?#{io.rewind}").body)
      end

      def create(name : String, location_id : String)
        JSON.parse(@session.post("/api/sections", raw: {"Name" => name, "LocationId" => location_id}.to_json).body)
      end

      def update(section_id : String, name : String, location_id : String)
        JSON.parse(@session.put("/api/sections/#{section_id}", raw: {"Name" => name, "LocationId" => location_id}.to_json).body)
      end

      def delete(section_id : String)
        JSON.parse(@session.delete("/api/sections/#{section_id}").body)
      end

      def list_locker_banks(section_id : String, page_number : Int32 = 1, page_size : Int32 = 10)
        io = IO::Memory.new
        builder = ParameterBuilder.new(io)

        builder.add("pageNumber", page_number)
        builder.add("pageSize", page_size)

        JSON.parse(@session.get("/api/sections/#{section_id}/lockerbanks?#{io.rewind}").body)
      end

      def list_allocatable_locker_bank_locker_groups(section_id : String, external_user_id : String, page_number : Int32 = 1, page_size : Int32 = 10) : Models::Responses::LockerBankLockerGroupResponse
        io = IO::Memory.new
        builder = ParameterBuilder.new(io)

        builder.add("externalUserId", external_user_id)
        builder.add("pageNumber", page_number)
        builder.add("pageSize", page_size)

        Models::Responses::LockerBankLockerGroupResponse.from_json \
          @session.get("/api/sections/#{section_id}/lockerbanklockergroups/allocatable?#{io.rewind}").body
      end
    end
  end
end
