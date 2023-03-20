require "../locker"
require "../paging"

module Vecos
  module Models
    module Responses
      class LockerCollectionResponse
        include JSON::Serializable

        @[JSON::Field(key: "Lockers")]
        property lockers : Array(Locker)

        @[JSON::Field(key: "Paging")]
        property paging : Paging
      end
    end
  end
end
