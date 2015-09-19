p 'Start Requests seed'

message = ['プロフィールを見て、大変興味を持ちました。お話してみませんか？',
'一目惚れです。承認お願いします',
'一緒にトークしませんか？',
'学歴に惹かれました。',
'顔、経歴、どれをとっても理想の方です。よろしくお願いします。',
'結婚を本気で考えています。承認よろしくお願い致します。']

user_count = User.all.count

1.upto(user_count) do |i|
  min = User.find(i).gender == 0 ? 40 : 1
  3.times do
    receiver = rand(min..min + 40)
    Request.create({sender_id: i, receiver_id: receiver, status: rand(0..2), message: message.sample})
  end
end
