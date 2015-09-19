count = 0
json.senders do
  json.array!(@sender_statuses) do |sender_status|
    json.extract! sender_status, :message, :status, :updated_at
    json.extract! @receivers[count], :name, :avatar
    count += 1
  end
end

count = 0
json.receivers do
  json.array!(@receiver_statuses) do |receiver_status|
    json.extract! receiver_status, :message, :status, :updated_at
    json.extract! @senders[count], :name, :avatar
    count += 1
  end
end