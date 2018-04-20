json.token @token
json.user do
  json.role @user.role
  json.total_donated humanized_money_with_symbol(
    Money.new(@user.donations.confirmed.sum(:amount_actual_cents))
   )
  json.goals_supported @user.donations.confirmed.distinct.count('donations.goal_id')
  json.total_users @user.donations.confirmed.distinct.count('donations.user_id')
end
