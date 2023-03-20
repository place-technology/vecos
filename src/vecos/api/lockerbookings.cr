module Vecos
  module API
    class LockerBookings
      def initialize(@session : Session)
      end

      def list_availability(external_user_id : String, page_number : Int32 = 1, page_size : Int32 = 10, location_id : String? = nil, section_id : String? = nil, locker_bank_id : String? = nil, locker_group_id : String? = nil, locker_id : String? = nil)
        io = IO::Memory.new
        builder = ParameterBuilder.new(io)

        builder.add("externalUserId", external_user_id)
        builder.add("pageNumber", page_number)
        builder.add("pageSize", page_size)

        builder.add("locationId", location_id) if location_id
        builder.add("sectionId", section_id) if section_id
        builder.add("lockerBankId", locker_bank_id) if locker_bank_id
        builder.add("lockerGroupId", locker_group_id) if locker_group_id
        builder.add("lockerId", locker_id) if locker_id

        JSON.parse(@session.get("/api/bookings/availability?#{io.rewind}").body)
      end

      def list(external_user_id : String, page_number : Int32 = 1, page_size : Int32 = 10)
        io = IO::Memory.new
        builder = ParameterBuilder.new(io)

        builder.add("externalUserId", external_user_id)
        builder.add("pageNumber", page_number)
        builder.add("pageSize", page_size)

        JSON.parse(@session.get("/api/bookings?#{io.rewind}").body)
      end

      def create(start_date_time_utc : String, end_date_time_utc : String, locker_group_id : String, locker_bank_id : String, locker_id : String, external_user_id : String)
        data = {
          "StartDateTimeUtc": start_date_time_utc,
          "EndDateTimeUtc":   end_date_time_utc,
          "LockerGroupId":    locker_group_id,
          "LockerBankId":     locker_bank_id,
          "LockerId":         locker_id,
          "ExternalUserId":   external_user_id,
        }

        JSON.parse(@session.post("/api/bookings", raw: data.to_json).body)
      end

      def delete(booking_id : String)
        JSON.parse(@session.delete("/api/bookings/#{booking_id}").body)
      end
    end
  end
end
