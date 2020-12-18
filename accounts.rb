# Create account
# add founds
# remove founds 
# trasfer founds
# Time to reach goal
class Account
    attr_accessor :name
    attr_accessor :funds
    attr_accessor :goal
    attr_accessor :income_hash
    attr_accessor :expense_hash
    # variables
    def initialize(name, funds)
        # income_hash = {}
        # expense_hash = {}

        @name = name
        @funds = funds.to_i
        @goal = goal
        @income_hash = {}
        @expense_hash = {} 
    end
    methods
    #display accounts
    
    

    def income_list(name, amount)
        @income_hash << { name => amount}  
    end

    
    def add_income(amount)
        @funds+=amount.to_i
    end
    def deduct_expense(amount)
        @funds-=amount.to_i
    end

    def to_s 
        name = @name
        funds = @funds
        goal = @goal
        return "#{name} #{funds} #{goal}"
    end
  
end