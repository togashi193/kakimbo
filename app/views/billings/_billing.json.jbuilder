json.id billing.id
json.date billing.billing_date
json.amount billing.amount
json.game do
  json.id billing.game.id
  json.name billing.game.name
end
json.note billing.note