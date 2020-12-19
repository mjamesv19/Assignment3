require "tty-prompt"
require_relative("./accounts.rb")
require_relative("./income.rb")
$prompt = TTY::Prompt.new


#setting up the menues
def home_menu
    return $prompt.select("welcome to the home menu, what would you like to manage? ",
    ["Accounts","Income","Expenses","Goals","Transfer","Exit"])
end
def accounts_menu
    return $prompt.select("welcome to the accounts menu, what would you like to do? ",
    ["View accounts","Create accounts","delete accounts","Goals","Go Back"])
end

def income_menu
    return $prompt.select("welcome to the income menu, what would you like to do? ",
    ["View income sources", "Add new income source", "Remove income source", "Add current income sources to connected acounts", "Go Back" ])
end
def expenses_menu
    return $prompt.select("welcome to the expenses menu, what would you like to do? ",
    ["View expenses list", "Add new expense", "Remove expense from list", "Deduct current expenses from to connected acounts", "Go Back" ])
end

#making accounts
account_array = []
account_array << savings1 = Account.new("Short_savings", "100")
account_array << savings2 = Account.new("Long_savings", "1000")
account_array << savings3 = Account.new("Emergency money", "500")
account_array << spending1 = Account.new("Card1","100")
account_array << spending2 = Account.new("Card2","30")
account_array << spending3 = Account.new("Card3","5")

#methods
accounts_list = []
def create_new_account
end
def delete_account
end
def view_account(array)#local var for method
    list_of_account_names = []
    array.each do |account| 
        list_of_account_names << account.name
    end
    return list_of_account_names
end

#income methods
def view_income_list(array)
    array.each  do |account|
        puts "    #{account.name} receives income from #{account.income_hash}."
    end
end
def create_new_income(array)# select account to add income to
    response = $prompt.select("which account would you like to attach an income to?", view_account(array))
    array.each do |account|
        if account.name == response
            source_name = $prompt.ask("What is the name of the provider of this of income? ")
            amount = $prompt.ask("How much money is added to the account from this source? (must enter whole number, doesn't accept sense): ")
            #checking if input is valid
            if amount.to_i.to_s == amount
                amount = amount.to_i
                account.income_hash[source_name] = amount
                puts "    $#{amount}, payed by #{source_name}, has been added to the income list for #{account.name} account."
            else
                puts "You have provided invalid answer please try again and follow the prompts. "
            end
        end
    end
end
def remove_income_from_list(array)
    response = $prompt.select("which account would you like to remove an income source from?",view_account(array))
    array.each do |account|
        if account.name == response
            if account.income_hash != {} #this loop prevents an empty hash from being selected to avoid an error
                keys_array = account.income_hash.keys
                puts keys_array
                source_name = $prompt.select("which source do you want to delete?", keys_array)
                puts "    #{source_name} is being deleted from list"
                account.income_hash.delete(source_name)
                puts 
            else
                puts "    ***This account has no income to remove***"
            end
            
        end
    end 
end

# def # add to income hash

# end

# testing
# puts account_array
# savings2.add_income(200)
# puts savings2
# income_hash = {}


# print account_array
# puts ""
# puts "________"

# @income_hash["testname"] = 50
# puts @income_hash

answer = ""
while answer != "Exit"
    answer = home_menu
    case answer
    when "Accounts"
        answer2 = ""
        while answer2 != "Go Back"
            answer2 = accounts_menu
            case answer2
            when "View accounts"
                puts view_account(account_array)
            when "Create accounts"
                puts "feature not available yet "
            when "Delete accounts"
                puts "feature not available yet "
            when "Goals"
            when "Go Back" 
            end     
        end
    when "Income"
        answer2 = ""
        while answer2 != "Go Back"
            answer2 = income_menu
            case answer2
            when "View income sources"
                view_income_list(account_array)
                
            when "Add new income source"
                create_new_income(account_array)

            when "Remove income source"
                remove_income_from_list(account_array)
            when "Add current income sources to connected acounts"
            when "Go Back" 
            end     
        end
 
    when "Expenses"
        answer2 = ""
        while answer2 != "Go Back"
            answer2 = expenses_menu
            case answer2
            when "View expenses list"
            when "Add new expense"
            when "Remove expense from list"
            when "Deduct current expenses from to connected acounts"
            when "Go Back" 
            end     
        end
        # 
        ["View expenses list", "add new expense", "remove expense from list", "deduct current expenses from to connected acounts", "Go Back" ]
        # 
    when "Goals"
        puts "show goals"
    when "Transfer"
        puts "5"
    when "Exit"
    end
    
end