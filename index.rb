require "tty-prompt"
$prompt = TTY::Prompt.new

#setting up the home menu
def home_menu
    return $prompt.select("what would you like to manage",
    ["Accounts","Income","Expenses","Goals","Transfer","Exit"])
end
def accounts_menu
    return $prompt.select("what would you like to manage",
    ["View accounts","Create accounts","delete accounts","Goals","Go Back"])
end


answer = ""
while answer != "Exit"
    answer = home_menu
    case answer
    when "Accounts"
        answer2 = ""
        while answer != "Exit"
            case answer
    when "Accounts"
        puts "Wellcome to the accounts menu."
        puts "what would you like to do?"
        answer2 = ""
        while answer2 != "Go Back"
            answer2 = accounts_menu
            case
            when "View accounts"    
            when "Create accounts"
            when "delete accounts"
            when "Goals"
            when "Go Back" 
            end     
        end
        answer = home_menu
    when "Income"
        puts "Wellcome to the accounts menu."
        puts "what would you like to do?"
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
        puts "3"
    when "Goals"
        puts "4"
    when "Transfer"
        puts "5"
    when "Exit"
        "bye"
    end
        end 
    when "Income"
        puts "2"
    when "Expenses"
        puts "3"
    when "Goals"
        puts "4"
    when "Transfer"
        puts "5"
    when "Exit"
        "bye"
    end
end