class WorkoutFormBuilder < ActionView::Helpers::FormBuilder

  attr_accessor :object_class

  helpers = field_helpers +
            %w{date_select datetime_select time_select} +
            %w{collection_select select country_select time_zone_select} -
            %w{hidden_field label fields_for submit} # Don't decorate these

  def label(method, text = nil, options = {})
    text = self.object_class.human_attribute_name( method.to_s )
    @template.label(@object_name, method, text, objectify_options(options))
  end

  def initialize(object_name, object, template, options, proc)
    super
    self.object_class = self.object.nil? ? self.object_name.to_s.camelize.constantize : self.object.class
  end

end

