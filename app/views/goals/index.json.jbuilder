json.array! @goals do |goal|
  json.id goal.id
  json.user_id goal.user_id
  json.name goal.name
  json.desc goal.desc
  json.total_amount humanized_money_with_symbol(Money.new(goal.amount_cents))
  json.total_approved_amount humanized_money_with_symbol(Money.new(goal.total_approved_donations))
  json.created_at goal.created_at
  json.updated_at goal.updated_at
  json.user do
    json.id goal.user_id
    json.handle goal.user.handle
  end
end