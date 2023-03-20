module Vecos
  module Models
    class LockerBank
      include JSON::Serializable

      @[JSON::Field(key: "Id")]
      property id : String

      @[JSON::Field(key: "Name")]
      property name : String

      @[JSON::Field(key: "SectionId")]
      property section_id : String

      @[JSON::Field(key: "LocationId")]
      property location_id : String

      @[JSON::Field(key: "Published")]
      property published : Bool

      @[JSON::Field(key: "RandomAllocation")]
      property random_allocation : Bool

      @[JSON::Field(key: "ServiceMode")]
      property service_mode : Bool

      @[JSON::Field(key: "Description")]
      property description : String
    end
  end
end
