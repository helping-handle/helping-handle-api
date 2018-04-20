json.array! @goals do |goal|
  json.id goal.id
  json.user_id goal.user_id
  json.name goal.name
  json.desc goal.desc
  json.amount_total humanized_money_with_symbol(
    Money.new(goal.amount_cents)
  )
  json.amount_approved humanized_money_with_symbol(
    Money.new(goal.amount_total)
  )
  json.amount_percent (goal.amount_percent * 100).round(2)
  json.confirmed_donations goal.donations.confirmed.count
  json.created_at goal.created_at
  json.updated_at goal.updated_at
  json.user do
    json.id goal.user_id
    json.handle goal.user.handle
    json.handle_cash goal.user.handle_cash
    json.handle_venmo goal.user.handle_venmo
    json.handle_paypal goal.user.handle_paypal
  end
  if user_signed_in?
    json.favorited !goal.favorite.nil?
  end
end
