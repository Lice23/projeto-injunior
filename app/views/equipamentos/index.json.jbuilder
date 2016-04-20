json.array!(@equipamentos) do |equipamento|
  json.extract! equipamento, :id, :desc, :disp
  json.url equipamento_url(equipamento, format: :json)
end
