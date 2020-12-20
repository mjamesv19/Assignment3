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
    ["View accounts","Create accounts","delete accounts","Go Back"])
end

def income_menu
    return $prompt.select("welcome to the income menu, what would you like to do? ",
    ["View income sources", "Add new income source", "Remove income source", "Add current income sources to connected accounts", "Go Back" ])
end
def expenses_menu
    return $prompt.select("welcome to the expenses menu, what would you like to do? ",
    ["View expenses list", "Add new expense", "Remove expense from list", "Deduct current expenses from to connected accounts", "Go Back" ])
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
def view_account(array, option)#local var for method
    list_of_account_names = []
    list_of_account_names_hash = {}
    array.each do |account| 
        list_of_account_names << account.name # used in another method to view just names
        list_of_account_names_hash[account.name] = account.funds #money and names
    end
    if option == "array"
        return list_of_account_names
    else 
        return list_of_account_names_hash
    end
end

#income methods
def view_income_list(array)
    array.each  do |account|
        puts "    #{account.name} receives income from #{account.income_hash}."
    end
end
def create_new_income(array)# select account to add income to
    response = $prompt.select("which account would you like to attach an income to?", view_account(array, "array"))
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
    response = $prompt.select("which account would you like to remove an income source from?",view_account(array, "array"))
    array.each do |account|
        if account.name == response
            if account.income_hash != {} #this loop prevents an empty hash from being selected to avoid an error
                keys_array = account.income_hash.keys
                # puts keys_array
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
def add_income_on_list_to_accounts(array)
    $prompt.ask("adding income to accounts, press enter to continue")
    array.each do |account|
        account.income_hash.each_value do |value|
            account.funds += value 
        end
    end
    puts view_account(array, "hash")
end

#expences menu
def view_expenses_list(array)
    array.each  do |account|
        puts "    #{account.name} spends money on #{account.expense_hash}."
    end
end
def create_new_expense(array)# select account 
    response = $prompt.select("which account would you like to attach an expense to?", view_account(array, "array"))
    array.each do |account|
        if account.name == response
            source_name = $prompt.ask("What is the name of the expense? ")
            amount = $prompt.ask("How much money is did you spend? (must enter whole number, doesn't accept sense): ")
            #checking if input is valid
            if amount.to_i.to_s == amount
                amount = amount.to_i
                account.expense_hash[source_name] = amount
                puts "    $#{amount}, spent #{source_name}, has been added to the expense list for #{account.name} account."
            else
                puts "You have provided invalid answer please try again and follow the prompts. "
            end
        end
    end
end
def remove_expense_from_list(array)
    response = $prompt.select("which account would you like to remove an expense from? ",view_account(array, "array"))
    array.each do |account|
        if account.name == response
            if account.expense_hash != {} #this loop prevents an empty hash from being selected to avoid an error
                keys_array = account.expense_hash.keys
                # puts keys_array
                source_name = $prompt.select("which source do you want to delete?", keys_array)
                puts "    #{source_name} is being deleted from list"
                account.expense_hash.delete(source_name)
                puts 
            else
                puts "    ***This account has no expense to remove***"
            end
            
        end
    end 
end
def add_expense_on_list_to_accounts(array)
    $prompt.ask("deducting expenses from accounts, press enter to continue")
    array.each do |account|
        account.expense_hash.each_value do |value|
            account.funds -= value 
        end
    end
    puts view_account(array, "hash")
end
# goal
def how_long_to_goal(array)
    response = $prompt.select("which account would you like calculate a goal?", view_account(array, "array"))
    array.each do |account|
        if account.name = response
            goal_amount = $prompt.ask("this account has #{account.funds}, how much money do you want this account to reach? please enter whole number. ")
            puts "taking the income and expense attached to this account"
            sleep(1)
            weeks = 0
            if goal_amount.to_i.to_s != goal_amount
                puts " you didn't enter a valid response please try again"
                break
            end
            in_debt = "no"
            start = account.funds
            while start <= goal_amount.to_i 
                account.income_hash.each_value do |value|
                    start += value 
                end
                account.expense_hash.each_value do |value|
                    start -= value 
                end
                if start <= 0
                    in_debt = "yes"
                    break
                else
                    weeks +=1
                end
            end
            if in_debt == "yes"
                puts "your expenses are greater than your income, can't caclulate time to goal. "
            else
                puts "starting with $#{account.funds}, it will take #{weeks} weeks to reach your goal of #{goal_amount}. "
            end
            break
        else 
            puts " you didn't enter a valid response please try again"
        end
    end
end

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
                puts view_account(account_array, "hash")
            when "Create accounts"
                puts "feature not available yet "
            when "Delete accounts"
                puts "feature not available yet "
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
            when "Add current income sources to connected accounts"
                add_income_on_list_to_accounts(account_array)
            when "Go Back" 
            end     
        end
 
    when "Expenses"
        answer2 = ""
        while answer2 != "Go Back"
            answer2 = expenses_menu
            case answer2
            when "View expenses list"
                view_expenses_list(account_array)
            when "Add new expense"
                create_new_expense(account_array)
            when "Remove expense from list"
                remove_expense_from_list(account_array)
            when "Deduct current expenses from to connected accounts"
                add_expense_on_list_to_accounts(account_array)
            when "Go Back" 
            end     
        end
    when "Goals"
        how_long_to_goal(account_array)
    when "Transfer"
        puts "feature coming soon"
    when "Exit"
    end
    
end