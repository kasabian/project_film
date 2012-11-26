class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.guest    
    if user.role.name == "admin"  
     can :manage, :all  
    elsif user.role.name == "user"  
      cannot :manage, [Slide, Setting] 
      can :read, :all  
      can :create, Comment
      can :destroy, Comment, :user_id => user.id
     else
      can :read, :all
      cannot :manage, [Slide, Setting] 
    end 
  end
end
