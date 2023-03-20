module Vecos
  module API
    class LockerBanks
      def initialize(@session : Session)
      end

      def list(page_number : Int32 = 1, page_size : Int32 = 10)
        io = IO::Memory.new
        builder = ParameterBuilder.new(io)

        builder.add("pageNumber", page_number)
        builder.add("pageSize", page_size)

        JSON.parse(@session.get("/api/lockerbanks?#{io.rewind}").body)
      end

      def get(locker_bank_id : String)
        JSON.parse(@session.get("/api/lockerbanks/#{locker_bank_id}").body)
      end

      def get_status(locker_bank_id : String) : Models::Responses::LockerBankSystemStatusResponse
        Models::Responses::LockerBankSystemStatusResponse.from_json \
          @session.get("/api/lockerbanks/#{locker_bank_id}/status").body
      end

      def create(name : String, description : String, door_number_prefix : String, number_order : Int32, number_order_reverse : Bool, random_allocation : Bool, section_id : String)
        data = {
          "Name"               => name,
          "Description"        => description,
          "DoorNumberPrefix"   => door_number_prefix,
          "NumberOrder"        => number_order,
          "NumberOrderReverse" => number_order_reverse,
          "RandomAllocation"   => random_allocation,
          "SectionId"          => section_id,
        }

        JSON.parse(@session.post("/api/lockerbanks", raw: data.to_json).body)
      end

      def set_master_pincode(locker_bank_id : String, code : String)
        JSON.parse(@session.post("/api/lockerbanks/#{locker_bank_id}/pincode", raw: {"PinCode" => code}.to_json).body)
      end

      def add_locker_brick(locker_bank_id : String, locker_brick_count : Int32, locker_count : Int32, is_z_locker : Bool, clockwise : Bool, first_number_top : Bool, insert_before_locker_brick_id : String? = nil)
        data = {
          "LockerCount"    => locker_count,
          "IsZLocker"      => is_z_locker,
          "Clockwise"      => clockwise,
          "FirstNumberTop" => first_number_top,
        }

        JSON.parse(@session.post("/api/lockerbanks/#{locker_bank_id}/#{locker_brick_count}", raw: data.to_json).body)
      end

      def publish(locker_bank_id : String)
        JSON.parse(@session.post("/api/lockerbanks/#{locker_bank_id}/publish").body)
      end

      def unpublish(locker_bank_id : String)
        JSON.parse(@session.post("/api/lockerbanks/#{locker_bank_id}/unpublish").body)
      end

      def autonumber(locker_bank_id : String, start_number : Int32 = 1)
        io = IO::Memory.new
        builder = ParameterBuilder.new(io)

        builder.add("startNumber", start_number)

        JSON.parse(@session.post("/api/lockerbanks/#{locker_bank_id}/autonumber?#{io.rewind}").body)
      end

      def redetect(locker_bank_id : String)
        JSON.parse(@session.post("/api/lockerbanks/#{locker_bank_id}/redetect").body)
      end

      def delete(locker_bank_id : String)
        JSON.parse(@session.delete("/api/lockerbanks/#{locker_bank_id}").body)
      end

      def delete_lockerbrick(locker_bank_id : String, locker_brick_id : String)
        io = IO::Memory.new
        builder = ParameterBuilder.new(io)

        builder.add("lockerBrickId", locker_brick_id)

        JSON.parse(@session.delete("/api/lockerbanks/#{locker_bank_id}/lockerbricks").body)
      end

      def delete_master_pincode(locker_bank_id : String)
        JSON.parse(@session.delete("/api/lockerbanks/#{locker_bank_id}/pincode").body)
      end

      def list_locker_bricks(locker_bank_id : String)
        JSON.parse(@session.get("/api/lockerbanks/#{locker_bank_id}/lockerbricks").body)
      end

      def list_locker_groups(locker_bank_id : String, page_number : Int32 = 1, page_size : Int32 = 10)
        io = IO::Memory.new
        builder = ParameterBuilder.new(io)

        builder.add("pageNumber", page_number)
        builder.add("pageSize", page_size)

        JSON.parse(@session.get("/api/lockerbanks/#{locker_bank_id}/lockergroups?#{io.rewind}").body)
      end

      def list_pincode_lockers(locker_bank_id : String, page_number : Int32 = 1, page_size : Int32 = 10)
        io = IO::Memory.new
        builder = ParameterBuilder.new(io)

        builder.add("pageNumber", page_number)
        builder.add("pageSize", page_size)

        JSON.parse(@session.get("/api/lockerbanks/#{locker_bank_id}/pincode/lockers?#{io.rewind}").body)
      end

      def list_lockers(locker_bank_id : String, page_number : Int32 = 1, page_size : Int32 = 10)
        io = IO::Memory.new
        builder = ParameterBuilder.new(io)

        builder.add("pageNumber", page_number)
        builder.add("pageSize", page_size)

        JSON.parse(@session.get("/api/lockerbanks/#{locker_bank_id}/lockers?#{io.rewind}").body)
      end

      def list_available_lockers(locker_bank_id : String, locker_group_id : String)
        JSON.parse(@session.get("/api/lockerbanks/#{locker_bank_id}/#{locker_group_id}/availablelockers").body)
      end

      def list_offline_locker_banks
        JSON.parse(@session.get("/api/lockerbanks/offline").body)
      end

      def list_offline_pincode_locker_banks
        JSON.parse(@session.get("/api/lockerbanks/pincode/offline").body)
      end

      def list_locker_bank_allocations(locker_bank_id : String, page_number : Int32 = 1, page_size : Int32 = 10)
        io = IO::Memory.new
        builder = ParameterBuilder.new(io)

        builder.add("pageNumber", page_number)
        builder.add("pageSize", page_size)

        JSON.parse(@session.get("/api/lockerbanks/#{locker_bank_id}/allocations?#{io.rewind}").body)
      end
    end
  end
end
