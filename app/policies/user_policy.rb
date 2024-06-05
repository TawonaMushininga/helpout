# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def show?
    update?
  end

  def update?
    user.id == record.id
  end

  def index?
    true
  end
end
