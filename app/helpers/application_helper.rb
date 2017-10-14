module ApplicationHelper
  def bootstrap_class_for(flash_type)
    case flash_type.to_sym
      when :success
        "notification success closeable"
      when :error
        "notification error closeable"
      when :alert
        "notification error closeable"
      when :notice
        "notification success closeable"
      when :warning
        "notification warning closeable"
      else
        flash_type.to_s
    end
  end
end
