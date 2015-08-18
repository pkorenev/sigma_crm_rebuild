json.array!(@simple_crms) do |simple_crm|
  json.extract! simple_crm, :id
  json.url simple_crm_url(simple_crm, format: :json)
end
