RailsAdmin.config do |config|
  config.asset_source = :sprockets

  ### Popular gems integration

  ## == Devise ==
   config.authenticate_with do
     warden.authenticate! scope: :funcionario
   end
   config.current_user_method(&:current_funcionario)

  ## == CancanCan ==
   config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/railsadminteam/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true
  

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  def perfil_format
    field :perfil do
      label "Dados Complementares"
      pretty_value do
        if bindings[:object].perfil.is_a?(Perfil)
          perfil = bindings[:object].perfil
          link = bindings[:view]
          team = bindings[:object]
          link.link_to(perfil.name + " " + perfil.sobrenome, link.show_path(model_name: 'Perfil', id: bindings[:object].perfil))
        elsif (bindings[:object].perfil_type.eql?("Funcionario"))
          perfil = bindings[:object]
          link = bindings[:view]
          team = bindings[:object]
          link.link_to(Funcionario.find(bindings[:object].perfil_id).cargo, link.show_path(model_name: 'Funcionario', id: bindings[:object].perfil_id))
        else
          perfil = bindings[:object]
          link = bindings[:view]
          team = bindings[:object]
          link.link_to(User.find(bindings[:object].perfil_id).email, link.show_path(model_name: 'User', id: bindings[:object].perfil_id))
        end
      end
    end
  end

  ActiveRecord::Base.descendants.each do |imodel|
    config.model "#{imodel.name}" do
      list do        
        exclude_fields :created_at, :updated_at, :tag, :remember_created_at, :reset_password_sent_at, :avatar, :id
      end
      edit do
        exclude_fields :tag, :perfil, :id
      end
      show do
        exclude_fields :tag, :id
      end
    end
  end
  

  config.model ActiveStorage::Blob do
    visible false
  end
  config.model ActiveStorage::Attachment do
    visible false
  end
  config.model ActiveStorage::VariantRecord do
    visible false
  end
end
