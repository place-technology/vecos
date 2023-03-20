module Vecos
  module API
    class Lockers
      def initialize(@session : Session)
      end

      def allocated(external_user_id : String, page_number : Int32 = 1, page_size : Int32 = 10) : Models::Responses::LockerCollectionResponse
        io = IO::Memory.new
        builder = ParameterBuilder.new(io)

        builder.add("externalUserId", external_user_id)
        builder.add("pageNumber", page_number)
        builder.add("pageSize", page_size)

        Models::Responses::LockerCollectionResponse.from_json \
          @session.get("/api/lockers/allocated?#{io.rewind}").body
      end

      def canallocate?(external_user_id : String)
        io = IO::Memory.new
        builder = ParameterBuilder.new(io)

        builder.add("externalUserId", external_user_id)

        JSON.parse(@session.get("/api/lockers/canallocate?#{io.rewind}").body)
      end

      def canallocate?(locker_id : String, external_user_id : String)
        io = IO::Memory.new
        builder = ParameterBuilder.new(io)

        builder.add("externalUserId", external_user_id)

        JSON.parse(@session.get("/api/lockers/canallocate/#{locker_id}?#{io.rewind}").body)
      end

      def unlock(locker_id : String, external_user_id : String, open_time : Int8)
        io = IO::Memory.new
        builder = ParameterBuilder.new(io)

        builder.add("externalUserId", external_user_id)
        builder.add("openTime", open_time)

        JSON.parse(@session.post("/api/lockers/#{locker_id}/unlock?#{io.rewind}").body)
      end

      def release(locker_id : String, external_user_id : String, ignore_self_release_allowed : Bool)
        io = IO::Memory.new
        builder = ParameterBuilder.new(io)

        builder.add("externalUserId", external_user_id)
        builder.add("ignoreSelfReleaseAllowed", ignore_self_release_allowed)

        JSON.parse(@session.post("/api/lockers/#{locker_id}/release?#{io.rewind}").body)
      end

      def allocate(locker_bank_id : String, locker_group_id : String, external_user_id : String)
        io = IO::Memory.new
        builder = ParameterBuilder.new(io)

        builder.add("lockerBankId", locker_bank_id)
        builder.add("lockerGroupId", locker_group_id)
        builder.add("externalUserId", external_user_id)

        JSON.parse(@session.post("/api/lockers/allocate?#{io.rewind}").body)
      end

      def allocate_dynamically(locker_id : String, external_user_id : String)
        io = IO::Memory.new
        builder = ParameterBuilder.new(io)

        builder.add("externalUserId", external_user_id)

        JSON.parse(@session.post("/api/lockers/#{locker_id}/allocate/dynamic?#{io.rewind}").body)
      end

      def allocate(locker_id : String, external_user_id : String)
        io = IO::Memory.new
        builder = ParameterBuilder.new(io)

        builder.add("externalUserId", external_user_id)

        JSON.parse(@session.post("/api/lockers/#{locker_id}/allocate?#{io.rewind}").body)
      end

      def block(locker_id : String)
        JSON.parse(@session.post("/api/lockers/#{locker_id}/block").body)
      end

      def unblock(locker_id : String)
        JSON.parse(@session.post("/api/lockers/#{locker_id}/unblock").body)
      end

      def attach_pincode(locker_id : String, code : String)
        JSON.parse(@session.post("/api/lockers/#{locker_id}/pincode", raw: {"PinCode" => code}.to_json).body)
      end

      def delete_pincode(locker_id : String)
        JSON.parse(@session.delete("/api/lockers/#{locker_id}/pincode").body)
      end

      def unlock_pincode(locker_id : String)
        JSON.parse(@session.post("/api/lockers/#{locker_id}/pincode/unlock").body)
      end

      def unlock_without_pincode(locker_id : String)
        JSON.parse(@session.post("/api/lockers/#{locker_id}/pincode/unlock/withoutpincode").body)
      end

      def share_by_path(locker_id : String, external_user_id : String, shared_user_id : String) : Models::Responses::NoResponse
        :NoResponse
        io = IO::Memory.new
        builder = ParameterBuilder.new(io)

        builder.add("externalUserId", external_user_id)

        @session.post("/api/lockers/#{locker_id}/share/#{shared_user_id}?#{io.rewind}")

        Models::Responses::NoResponse.from_json("{}")
      end

      def share_by_query(locker_id : String, external_user_id : String, shared_user_id : String)
        io = IO::Memory.new
        builder = ParameterBuilder.new(io)

        builder.add("sharedUserId", shared_user_id)
        builder.add("externalUserId", external_user_id)

        JSON.parse(@session.post("/api/lockers/#{locker_id}/share?#{io.rewind}").body)
      end

      def unshare_by_path(locker_id : String, external_user_id : String, shared_user_id : String)
        io = IO::Memory.new
        builder = ParameterBuilder.new(io)

        builder.add("externalUserId", external_user_id)

        JSON.parse(@session.post("/api/lockers/#{locker_id}/unshare/#{shared_user_id}?#{io.rewind}").body)
      end

      def unshare(locker_id : String, external_user_id : String)
        io = IO::Memory.new
        builder = ParameterBuilder.new(io)

        builder.add("externalUserId", external_user_id)

        JSON.parse(@session.post("/api/lockers/#{locker_id}/unshare?#{io.rewind}").body)
      end

      def shared_locker_users(locker_id : String, external_user_id : String)
        io = IO::Memory.new
        builder = ParameterBuilder.new(io)

        builder.add("externalUserId", external_user_id)

        JSON.parse(@session.get("/api/lockers/#{locker_id}/sharedlockerusers?#{io.rewind}").body)
      end

      def shareable_locker_users(locker_id : String, external_user_id : String, search_string : String)
        io = IO::Memory.new
        builder = ParameterBuilder.new(io)

        builder.add("externalUserId", external_user_id)
        builder.add("searchString", search_string)

        JSON.parse(@session.get("/api/lockers/#{locker_id}/shareablelockerusers?#{io.rewind}").body)
      end
    end
  end
end
