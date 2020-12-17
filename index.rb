require "tty-prompt"
$prompt = TTY::Prompt.new

#setting up the home menu
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
    ["View income sources", "add new income source", "remove income source", "Add current income sources to connected acounts", "Go Back" ])
end
def expenses_menu
    return $prompt.select("welcome to the expenses menu, what would you like to do? ",
    ["View expenses list", "add new expense", "remove expense from list", "deduct current expenses from to connected acounts", "Go Back" ])
end

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
            when "add new income source"
            when "remove income source"
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