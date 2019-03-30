module ApplicationHelper
    def full_address(address,city,postal_code,province)
        return address + ' ' + postal_code + ' ' + city +  ' (' + province + ')'
    end
end
