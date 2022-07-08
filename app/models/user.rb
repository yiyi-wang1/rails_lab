class User < ApplicationRecord

    # def self.search(search_term)
    #     where("first_name OR last_name OR email",search_term, search_term, search_term)
    # end

    def self.search(search_term)
        users = []
        users << find_by_first_name(search_term)
        users << find_by_last_name(search_term)
        users << find_by_email(search_term)
        users.select{|x| !x.nil?}
    end
end
