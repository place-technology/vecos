module Vecos
  module Models
    class Paging
      include JSON::Serializable

      @[JSON::Field(key: "FirstItemOnPage")]
      property first_item_on_page : Int32

      @[JSON::Field(key: "HasNextPage")]
      property has_next_page : Bool

      @[JSON::Field(key: "HasPreviousPage")]
      property has_previous_page : Bool

      @[JSON::Field(key: "IsFirstPage")]
      property is_first_page : Bool

      @[JSON::Field(key: "IsLastPage")]
      property is_last_page : Bool

      @[JSON::Field(key: "LastItemOnPage")]
      property last_item_on_page : Int32

      @[JSON::Field(key: "PageCount")]
      property page_count : Int32

      @[JSON::Field(key: "PageNumber")]
      property page_number : Int32

      @[JSON::Field(key: "PageSize")]
      property page_size : Int32

      @[JSON::Field(key: "TotalItemCount")]
      property total_item_count : Int32
    end
  end
end
