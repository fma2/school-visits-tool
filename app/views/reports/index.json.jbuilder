json.array!(@reports) do |report|
  json.extract! report, :id, :new, :create
  json.url report_url(report, format: :json)
end
