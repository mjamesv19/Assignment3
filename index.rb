require_relative("./accounts.rb")

savings = Account.new("savings", "10000", "y")
spending = Account.new("spending", "200", "n")

# puts savings.income(500)
# puts savings.expenses(1000)
# puts savings.set_goal(20000)
puts savings.funds