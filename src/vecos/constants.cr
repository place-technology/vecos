module Vecos
  module Constants
    VERSION = {{ `shards version #{__DIR__}`.chomp.stringify }}

    DEFAULT_SINGLE_REQUEST_TIMEOUT = 60

    STATUS_CODES = {
      400 => "Bad Request",
      401 => "User is not authorized to perform the request, or the OAuth access token is expired",
      403 => "Associated company cannot be found, has System API access disabled or is currently in inaccessible",
      404 => "Requested resource is not found or the user is not authorized to access it",
    }
  end
end
