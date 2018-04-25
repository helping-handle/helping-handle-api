json.extract! current_user, :id, :name, :email, :handle, :handle_cash,
              :handle_venmo, :handle_paypal,
              :about, :interests, :education, :goals,
              :role
json.total_donated humanized_money_with_symbol(
  Money.new(current_user.donations.confirmed.sum(:amount_actual_cents))
)
json.goals_supported
current_user.donations.confirmed.distinct.count('donations.goal_id')
json.total_users
current_user.donations.confirmed.distinct.count('donations.user_id')
