module Vecos
  module Models
    class Locker
      include JSON::Serializable

      @[JSON::Field(key: "Id")]
      property id : String

      @[JSON::Field(key: "LockerGroupId")]
      property locker_group_id : String

      @[JSON::Field(key: "LockerBankId")]
      property locker_bank_id : String

      @[JSON::Field(key: "LockerBrickId")]
      property locker_brick_id : String

      @[JSON::Field(key: "Blocked")]
      property blocked : Bool

      @[JSON::Field(key: "IsUsable")]
      property is_usable : Bool

      @[JSON::Field(key: "IsDetected")]
      property is_detected : Bool

      @[JSON::Field(key: "FullDoorNumber")]
      property full_door_number : String

      @[JSON::Field(key: "DoorNumberPrefix")]
      property door_number_prefix : String

      @[JSON::Field(key: "DoorNumber")]
      property door_number : Int32

      @[JSON::Field(key: "SelfReleaseAllowed")]
      property self_release_allowed : Bool

      @[JSON::Field(key: "DynamicAllocated")]
      property dynamic_allocated : Bool

      @[JSON::Field(key: "OpenTime")]
      property open_time : Int32

      @[JSON::Field(key: "NrOfAllocations")]
      property number_of_allocations : Int32

      @[JSON::Field(key: "SharedToUser")]
      property shared_to_user : Bool

      @[JSON::Field(key: "IsShared")]
      property is_shared : Bool

      @[JSON::Field(key: "IsShareable")]
      property is_shareable : Bool

      @[JSON::Field(key: "SequenceNumber")]
      property sequence_number : Int32

      @[JSON::Field(key: "StartDateTimeUtc")]
      property start_date_time_utc : String

      @[JSON::Field(key: "NumberOfDigitsForDoorNumber")]
      property number_of_digits_for_door_number : Int32
    end
  end
end
