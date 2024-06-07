# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.present?
      if user.has_role? :admin
        can :manage, :all
      else
        can :read, Product
      end
    else
      can :read, Product
    end
  end
end
