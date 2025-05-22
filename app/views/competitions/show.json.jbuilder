json.id                                     @competition.id
json.name                                   @competition.name
json.start_date                             @competition.start_date
json.end_date                               @competition.end_date
json.participation_charge_formatted         @competition.participation_charge.format(symbol: '€ ', decimal_mark: ',', no_cents: (@competition.participation_charge % 100 == 0))
json.participation_charge_cents             @competition.participation_charge_cents
json.participation_charge_currency          @competition.participation_charge_currency
json.created_at                             @competition.created_at
json.updated_at                             @competition.updated_at
json.slug                                   @competition.slug

json.training_sessions @training_sessions.each do |r|
  json.id                                         r.id
  json.name                                       r.name
  json.competition_id                             r.competition_id
  json.start_date                                 r.start_date.strftime("%d.%m.%Y")
  json.end_date                                   r.end_date.strftime("%d.%m.%Y")
  json.start_time                                 r.start_date.strftime("%H:%M")
  json.end_time                                   r.end_date.strftime("%H:%M")
  json.participation_charge_formatted             r.participation_charge.format(symbol: '€ ', decimal_mark: ',', no_cents: (r.participation_charge % 100 == 0))
  json.participation_charge_cents                 r.participation_charge_cents
  json.participation_charge_currency              r.participation_charge_currency
  json.created_at                                 r.created_at
  json.updated_at                                 r.updated_at
end