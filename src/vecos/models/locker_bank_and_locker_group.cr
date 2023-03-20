require "./locker_bank"
require "./locker_group"

module Vecos
  module Models
    class LockerBankAndLockerGroup
      include JSON::Serializable

      @[JSON::Field(key: "LockerBank")]
      property locker_bank : LockerBank

      @[JSON::Field(key: "LockerGroup")]
      property locker_group : LockerGroup
    end
  end
end
