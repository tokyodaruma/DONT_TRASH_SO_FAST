class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.allgit
    end
  end

  def show?
    true
  end

  def index?
    true
  end

  def create?
    true
  end
end
