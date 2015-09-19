require 'date'

from = Date.parse('1950/01/01')
to   = Date.parse('1997/12/31')

company_name = ['総務省', 'LINE', 'ミッフィー家']

hobbies = ['マイナンバーが大好きです。マイナンバーのことなら何でも答えます。', 'いつも明るくてオシャレ。
好きなことはダイエット。 なうさぎの女の子です。', '正義感の強いところもあるが、いたずら好きなところもある']

name = ['マイナ', 'コニー', 'ミッフィー']

preference_type = '人外'
my_type = '人外'

avatar = ['http://www.sakimura.org/wp-content/uploads/2014/08/myna-all-01.png',
  'https://pbs.twimg.com/profile_images/3168075490/44c64937a29524ad6686bef8b303c9ab.jpeg',
  'http://www.freshnewsdelivery.com/media/11/20130322-MIFFY.jpg']


0.upto(2) do |i|
  face_type_id = FaceType.find_by(kind: my_type).id
  birthday = Random.rand(from .. to)
  user = User.create(
    {
      my_number: (i + 81).to_s,
      name: name[i],
      birthdate: birthday,
      address: Gimei.address.kanji,
      hobby: hobbies[i],
      gender: 1,
      avatar: avatar[i],
      face_type_id: face_type_id
    }
  )

  user = User.find(user.id)

  user.preference_faces.build(face_type_id: FaceType.find_by(kind: preference_type).id)

  if user.save
    p "Insert #{ user.name }"
  else
    p user.errors.full_messages
  end
end
