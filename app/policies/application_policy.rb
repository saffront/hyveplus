class ApplicationPolicy
  attr_reader :user, :record

  #Model object is called record
  def initialize(user, record)
    @user = user
    @record = record
  end

  def is_admin
    user && user.role == "admin"
  end

  def scope
    record.class
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
