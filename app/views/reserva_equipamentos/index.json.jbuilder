json.array!(@reserva_equipamentos) do |reserva_equipamento|
  json.extract! reserva_equipamento, :id, :equipamento_id, :user_id, :data_ini_equip, :data_fin_equip
  json.url reserva_equipamento_url(reserva_equipamento, format: :json)
end
