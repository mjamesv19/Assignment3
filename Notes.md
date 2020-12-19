# Budget APP
need for gems
watch lecture from week 7
# Links
- https://trello.com/b/Rv6WqxxZ/terminal-app

# Features 
## Accounts
- look at all the accounts
- create new accounts
- delete accounts

## Income
- list source of income and add it to an account
- add new sources of income
- remove sources of income
- add funds to accounts

## Expenditure
- view list of expences 
- add expences to list
- remove expences from list
- deduct funds from accounts

## Goal
- set a goal for an account
- enter your average income expenses 
- return number of weeks/months/years to reach goal.

def create_new_income(array)# select account to add income to
    response = $prompt.select("which account would you like to attach an income to?", view_account(array))
    array.each do |account|
        if account.name == response
            source_name = prompt.ask("What is the name of this source of income? ")
            amount = prompt.ask("How much money is added to the account from this sources?")
            #checking if input is valid
            if amount.to_f.to_s == amount
                hash[source_name] = amount
                puts "#{amount}, payed by #{source_name} has been added to the income list for #{response}"
            else
                puts "You have provided invalid answer please try again and follow the prompts. "
            end
        else
            puts "error. This error should not happen because the users input is limited to valid answers. "
        end
    end