module AuthorizationHelpers
  def define_permission!(role_id, resource, action)

    Permission.create!(:role_id => role_id,
                       :subject_class => resource,
                       :action => action
                      )
  end
end

