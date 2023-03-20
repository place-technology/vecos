require "../locker_bank_and_locker_group"
require "../paging"

module Vecos
  module Models
    module Responses
      class LockerBankLockerGroupResponse
        include JSON::Serializable

        @[JSON::Field(key: "LockerBankAndLockerGroups")]
        property locker_bank_and_locker_groups : Array(LockerBankAndLockerGroup)

        @[JSON::Field(key: "Paging")]
        property paging : Paging
      end
    end
  end
end
