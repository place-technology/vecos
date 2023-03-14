module Vecos
  class Client
    Log = ::Log.for(self)

    @session : Session = Session.new(OAuth2::AccessToken::Bearer.new("eyLm4oO0==", nil, nil, nil, nil))

    getter companies : API::Companies
    getter events : API::Events
    getter locations : API::Locations
    getter locker_banks : API::LockerBanks
    getter locker_bookings : API::LockerBookings
    getter locker_groups : API::LockerGroups
    getter lockers : API::Lockers
    getter pincodes : API::Pincodes
    getter sections : API::Sections

    def initialize(client_id : String, client_secret : String, username : String, password : String, token_uri : String = "/connect/token")
      client = OAuth2::Client.new("acc-identity.releezme.net", client_id, client_secret, token_uri: token_uri)
      access_token = client.get_access_token_using_resource_owner_credentials(username: username, password: password, scope: "Vecos.Releezme.Web.SAPI offline_access")

      @session = Session.new(access_token)

      @companies = API::Companies.new(@session)
      @events = API::Events.new(@session)
      @locations = API::Locations.new(@session)
      @locker_banks = API::LockerBanks.new(@session)
      @locker_bookings = API::LockerBookings.new(@session)
      @locker_groups = API::LockerGroups.new(@session)
      @lockers = API::Lockers.new(@session)
      @pincodes = API::Pincodes.new(@session)
      @sections = API::Sections.new(@session)

      spawn do
        loop do
          sleep access_token.expires_in.not_nil!

          access_token = client.get_access_token_using_refresh_token(access_token.refresh_token)
          @session = Session.new(access_token)
        end
      end
    end
  end
end
