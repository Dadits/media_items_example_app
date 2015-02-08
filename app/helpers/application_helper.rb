module ApplicationHelper
  def define_item_partial(type)
    %w(image).include?(type) ? 'image' : 'link'
  end
  
  def alert_class_for(type)
    { alert: 'alert-danger', notice: 'alert-success' }[type.to_sym] || type.to_s
  end
  
  def link_to_add_fields(name, f, as)
    new_objects = f.object.send(as).klass.new
    id = new_objects.object_id
    fields = f.fields_for(as, new_objects, child_index: id) do |cf|
      render(as.to_s.singularize + "_fields", f: cf)
    end
    link_to(name, '#', class: 'add_fields', data: { id: id, fields: fields.gsub("\n", "") })
  end
  
end
