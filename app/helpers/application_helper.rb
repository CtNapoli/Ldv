module ApplicationHelper
    def error_messages(model, field)
      if model.errors.messages[field].any?
        return content_tag :div, model.errors.messages[field].join(', '), class: 'text-danger'
      end
    end

    def alert_messages
      return content_tag :div, flash.notice, class: 'alert alert-success' if flash.notice.present?
      return content_tag :div, flash.alert, class: 'alert alert-danger' if flash.alert.present?
    end
      
    def full_address(address,city,postal_code,province)
        return address + ' ' + postal_code + ' ' + city +  ' (' + province + ')'
    end

    def price(value)
      return "#{value&.round(0)}€"
    end
end
