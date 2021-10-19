# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    @employer_ids = Employer.joins(memberships: :role).where(role: {character: 'Admin'}).where(memberships: {user_id: user.id}).pluck(:id)

    can :read, Employer, id: @employer_ids
  end  
end
