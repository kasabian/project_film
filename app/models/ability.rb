class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.guest    
    if user.role.name == "admin"  
     can :manage, :all  
    elsif user.role.name == "user" 
      cannot :manage, [Slide, Setting, Ad]
      can :read, :all
      can :rate, :all
      can :create, Comment
      can :destroy, Comment, :user_id => user.id
     else
      can :read, :all
      can :rate, :all
      cannot :manage, [Slide, Setting, Ad]
    end 
  end
end
