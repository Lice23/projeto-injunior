json.array!(@salas) do |sala|
  json.extract! sala, :id, :nome, :predio, :cont_proj, :disp
  json.url sala_url(sala, format: :json)
end
