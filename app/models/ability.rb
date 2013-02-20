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
    elsif user.role.name == "moderator"  
      can :create, Comment
      can :destroy, Comment, :user_id => user.id
      can :update, Film
      can :create, Film
      can :update, News
      can :create, News 
      can :update, Announcement
      can :create, Announcement 
      can :read, :all
      cannot :manage, [Slide, Setting, Ad]
    else
      can :read, :all
      can :rate, :all
      cannot :manage, [Slide, Setting, Ad]
    end 
  end
end
