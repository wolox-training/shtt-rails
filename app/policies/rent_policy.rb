class RentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user_id: user.id)
    end
  end

  def create?
    user.present? && record.user == user
  end
end
