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
    def initialize(name, funds, goal)
        @name = name
        @funds = funds.to_i
        @goal = goal
    end
    #methods

    def income(amount) #adding money to account
        puts "adding money"
        @funds+=amount.to_i
    end

    def expenses(amount) # removing money from account
        puts "spent money"
        @funds-=amount
    end

    def set_goal(amount)
        puts "you have a goal"
        @goal = amount
    end

    def time_to_goal
        puts "you are on your way to the goal`"
    end
end