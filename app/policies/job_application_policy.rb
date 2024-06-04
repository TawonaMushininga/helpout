# frozen_string_literal: true

class JobApplicationPolicy < ApplicationPolicy

    def index?
        true
    end

    def show?
        true
    end

    def create?
        true
    end
  
    def update?
        true
    end

    def destroy?
        true
    end

    def accept?
        true
    end

    def reject?
        true
    end
  end
  