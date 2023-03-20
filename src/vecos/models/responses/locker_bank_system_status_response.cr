require "../locker_group_status"

module Vecos
  module Models
    module Responses
      class LockerBankSystemStatusResponse
        include JSON::Serializable

        @[JSON::Field(key: "LockerBankId")]
        property locker_bank_id : String

        @[JSON::Field(key: "LockerBankName")]
        property locker_bank_name : String

        @[JSON::Field(key: "LockerBankDescription")]
        property locker_bank_description : String

        @[JSON::Field(key: "ServiceMode")]
        property service_mode : Bool

        @[JSON::Field(key: "StatusPerLockerGroup")]
        property status_per_locker_group : Array(LockerGroupStatus)
      end
    end
  end
end
