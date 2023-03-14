module Vecos
  module API
    class LockerGroups
      def initialize(@session : Session)
      end

      def get(locker_group_id : String)
        JSON.parse(@session.get("/api/lockergroups/#{locker_group_id}").body)
      end

      def list(page_number : Int32, page_size : Int32)
        io = IO::Memory.new
        builder = ParameterBuilder.new(io)

        builder.add("pageNumber", page_number)
        builder.add("pageSize", page_size)

        JSON.parse(@session.get("/api/lockergroups?#{io.rewind}").body)
      end

      def list_locker_banks(locker_group_id : String, page_number : Int32, page_size : Int32)
        io = IO::Memory.new
        builder = ParameterBuilder.new(io)

        builder.add("pageNumber", page_number)
        builder.add("pageSize", page_size)

        JSON.parse(@session.get("/api/lockergroups/#{locker_group_id}/lockerbanks?#{io.rewind}").body)
      end
    end
  end
end
