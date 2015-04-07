class UserPolicy < ApplicationPolicy

	def index?
    is_admin
	end

  def show?
    is_admin
  end

	def edit?
    is_admin
	end

	def update?
    is_admin
	end

	def destroy?
    is_admin
	end

  class Scope < Scope
    def resolve
      if user.role == "admin"
        scope.all
      end
    end
  end
end
