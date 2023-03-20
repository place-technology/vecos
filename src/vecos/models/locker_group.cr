module Vecos
  module Models
    class LockerGroup
      include JSON::Serializable

      @[JSON::Field(key: "Id")]
      property id : String

      @[JSON::Field(key: "Name")]
      property name : String

      @[JSON::Field(key: "LockMode")]
      property lock_mode : Int32

      @[JSON::Field(key: "LockerBookingFeatureEnabled")]
      property locker_booking_feature_enabled : Bool

      @[JSON::Field(key: "PostalServiceFeatureEnabled")]
      property postal_service_feature_enabled : Bool
    end
  end
end
