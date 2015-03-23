class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def is_admin
    user && user.role == "admin"
  end

  #def is_user
    #user && !user.admin?
  #end

  #def is_logged_in
    #user.id != nil
  #end

  #def the_author
    #record.user_id == user.id
  #end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end

  end

end

#Default auto gen policies-for reference :)

#def index?
  #false
#end

#def show?
  #scope.where(:id => record.id).exists?
#end

#def create?
  #false
#end

#def new?
  #create?
#end

#def update?
  #false
#end

#def edit?
  #update?
#end

#def destroy?
  #false
#end
