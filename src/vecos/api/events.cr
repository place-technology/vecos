module Vecos
  module API
    class Events
      def initialize(@session : Session)
      end

      def pincode
        io = IO::Memory.new
        builder = ParameterBuilder.new(io)

        builder.add("useRawEvents", false)

        JSON.parse(@session.get("/api/events/pincode/events?#{io.rewind}").body)
      end

      def pincode(after_event_id : String)
        io = IO::Memory.new
        builder = ParameterBuilder.new(io)

        builder.add("useRawEvents", false)

        JSON.parse(@session.get("/api/events/pincode/events/#{after_event_id}?#{io.rewind}").body)
      end

      def locker
        JSON.parse(@session.get("/api/events/locker/events").body)
      end

      def locker(after_event_id : String)
        JSON.parse(@session.get("/api/events/locker/events/#{after_event_id}").body)
      end
    end
  end
end
