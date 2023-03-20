module Vecos
  module Models
    class LockerGroupStatus
      include JSON::Serializable

      @[JSON::Field(key: "LockerGroupId")]
      property locker_group_id : String

      @[JSON::Field(key: "LockerGroupName")]
      property locker_group_name : String

      @[JSON::Field(key: "UsableLockers")]
      property usable_lockers : Int32

      @[JSON::Field(key: "UnusableLockers")]
      property unusable_lockers : Int32

      @[JSON::Field(key: "PublicLockers")]
      property public_lockers : Int32

      @[JSON::Field(key: "AvailableDynamicLockers")]
      property available_dynamic_lockers : Int32

      @[JSON::Field(key: "AllocatedDynamicLockers")]
      property allocated_dynamic_lockers : Int32

      @[JSON::Field(key: "BlockedAllocatedDynamicLockers")]
      property blocked_allocated_dynamic_lockers : Int32

      @[JSON::Field(key: "BlockedUnallocatedDynamicLockers")]
      property blocked_unallocated_dynamic_lockers : Int32

      @[JSON::Field(key: "AvailableStaticLockers")]
      property available_static_lockers : Int32

      @[JSON::Field(key: "AllocatedStaticLockers")]
      property allocated_static_lockers : Int32

      @[JSON::Field(key: "BlockedAllocatedStaticLockers")]
      property blocked_allocated_static_lockers : Int32

      @[JSON::Field(key: "BlockedUnallocatedStaticLockers")]
      property blocked_unallocated_static_lockers : Int32
    end
  end
end
