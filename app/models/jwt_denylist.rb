class JwtDenylist < ApplicationRecord
    include Devise::JWT::RevocationStrategies::Denylist

    self.tablename = 'jwt_denylist'
end
