json.array!(@owners) do |owner|
  json.extract! owner, :id, :first_name, :last_name, :phone, :emerg_name, :emerg_phone
  json.url owner_url(owner, format: :json)
end
