module Vecos
  module API
    class Pincodes
      def initialize(@session : Session)
      end

      def update_master_pincode(pincode_id : String, code : String)
        JSON.parse(@session.put("/api/pincodes/#{pincode_id}/masterpincode", raw: {"PinCode" => code}.to_json).body)
      end

      def update_pincode(pincode_id : String, code : String)
        JSON.parse(@session.put("/api/pincodes/#{pincode_id}/pincode", raw: {"PinCode" => code}.to_json).body)
      end
    end
  end
end
