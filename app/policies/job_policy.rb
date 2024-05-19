# frozen_string_literal: true

class JobPolicy < ApplicationPolicy

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

    def complete?
        true
    end

    def cancel?
        true
    end

    def decline?
        true
    end

  end
  