module ContactsHelper
    def choose_new
        if action_name == 'new' || action_name == 'confirm'
            confirm_contacts_path
        else
            contact_path    
        end
    end
end
