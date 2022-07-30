class Lister::BookingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.joins(:surplus).where(surplus: {user: user})
    end
  end

  def update?
    user == record.surplus.user
  end
end
