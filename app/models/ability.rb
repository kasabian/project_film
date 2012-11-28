class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.guest    
    if user.role.name == "admin"  
     can :manage, :all  
    elsif user.role.name == "user"  
      can :read, :all  
      can :create, Comment
      can :destroy, Comment, :user_id => user.id
      cannot :manage, [Slide, Setting, Ad] 
    else
      can :read, :all
      cannot :manage, [Slide, Setting, Ad] 
    end 
  end
end
