class UserPolicy < ApplicationPolicy

  def index?
    user_admin?
  end

  def show?
    user_present? and
      (record.eql?(user) or
        user.admin?)
  end

  def destroy?
    user_admin?
  end

  def create?
    user_admin?
  end

  def update?
    user_admin?
  end

  private

  def user_present?
    user.present?
  end

  def user_admin?
    user_present? and user.admin?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
