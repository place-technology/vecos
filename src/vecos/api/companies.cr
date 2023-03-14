module Vecos
  module API
    class Companies
      def initialize(@session : Session)
      end

      def list
        JSON.parse(@session.get("/api/companies").body)
      end

      def qr(company_guid : String)
        JSON.parse(@session.get("/api/companies/#{company_guid}/qr").body)
      end
    end
  end
end
