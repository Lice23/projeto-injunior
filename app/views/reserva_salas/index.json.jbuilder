json.array!(@reserva_salas) do |reserva_sala|
  json.extract! reserva_sala, :id, :sala_id, :user_id, :data_ini_sala, :data_fin_sala
  json.url reserva_sala_url(reserva_sala, format: :json)
end
