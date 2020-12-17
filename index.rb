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
    ["View expenses list", "add new expense", "remove expense from list", "deduct current expenses from to connected acounts", "Go Back" ])
end
#methods
def Create_new_account
    puts "what is the name of the new account"
    name_of_new_account = gets.chomp
    puts "how much money in the account?"
    money_in_new_account = gets.chomp.to_i
    Account.new(name_of_new_account, money_in_new_account) 
end
#making accounts

answer = ""
while answer != "Exit"
    answer = home_menu
    case answer
    when "Accounts"
        answer2 = ""
        while answer2 != "Go Back"
            answer2 = accounts_menu
            case
            when "View accounts"
            when "Create accounts"
            when "Delete accounts"
            when "Goals"
            when "Go Back" 
            end     
        end
        answer = home_menu
    when "Income"
        answer2 = ""
        while answer2 != "Go Back"
            answer2 = income_menu
            case
            when "View income sources"
                puts "view button"   
            when "Add new income source"
                puts "new button"
            when "Remove income source"
            when "Add current income sources to connected acounts"
            when "Go Back" 
            end     
        end
        answer = home_menu
    when "Expenses"
        answer2 = ""
        while answer2 != "Go Back"
            answer2 = expenses_menu
            case
            when "View expenses list"    
            when "add new expense"
            when "remove expense from list"
            when "deduct current expenses from to connected acounts"
            when "Go Back" 
            end     
        end
    when "Goals"
        puts "show goals"
    when "Transfer"
        puts "5"
    when "Exit"
        "bye"
    end
    
end