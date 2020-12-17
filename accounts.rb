# Create account
# add founds
# remove founds 
# trasfer founds
# Time to reach goal
class Account
    attr_reader :name
    attr_reader :funds
    attr_reader :goal
    # variables
    def initialize(name, funds)
        @name = name
        @funds = funds.to_i
        @goal = goal
    end
    #methods
    # def print_account_names
    #     names = []
    #     @account.each do |account|
    #        names << account.name
    #     end
    #     return names
    # end
   

  
end