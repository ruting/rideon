module ApplicationHelper
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end
  
 def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def link_to_add_locations(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields btn-mini", data: {id: id, fields: fields.gsub("\n", "")})
  end



end
