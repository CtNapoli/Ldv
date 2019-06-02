module ApplicationHelper
    def error_messages(model, field)
        if model.errors.messages[field].any?
          return content_tag :div, model.errors.messages[field].join(', '), class: 'text-danger'
        end
      end
      
    def full_address(address,city,postal_code,province)
        return address + ' ' + postal_code + ' ' + city +  ' (' + province + ')'
    end

    def price(value)
      return "#{value}€"
    end
end
