module ApplicationHelper
  def warning
    warning = notice || alert
    content_tag(:p, "#{warning}", class: "bg-warning") if warning.present?
  end
end
