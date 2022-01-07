# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    if user.is_a?(Funcionario)
      can :access, :rails_admin
      if Funcionario.cargos[user.cargo] == Funcionario.cargos[:"Super-Administrador"]
        can :manage, :all
        can :read, :dashboard
      elsif Funcionario.cargos[user.cargo] == Funcionario.cargos[:"Administrador"]
        can :manager, Produto
        can :manager, Funcionario
        can :manager, Parcela
        can :manager, Categoria
        can :manager, Perfil
      elsif Funcionario.cargos[user.cargo] == Funcionario.cargos[:"Vendedor"]
        can :read, :dashboard
        can :read, Produto
        can :read, Funcionario, ["id = ?", user.id] do |funcionario|
          funcionario
        end
        can :read, Perfil
        can :read, Venda, ["funcionario_id = ?", user.id] do |venda|
          venda
        end
        can :new, Venda
        can :create, Venda
        can :create, ItemVendido
      elsif Funcionario.cargos[user.cargo] == Funcionario.cargos[:"Agente de Cobranca"]
        can :update, Parcela
        can :read, Parcela
      end
      
    elsif user.is_a?(User)
        can :manage, :all
        can :access, :rails_admin
        can :read, :dashboard
      
    end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
