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

elder_school = ['野々市小学校', '御園小学校', '菅原小学校', '富陽小学校', '館野小学校']
junior_high_school = ['野々市中学校', '布水中学校']
high_school = ['金沢泉丘高等学校', '金沢向陽高等学校', '野々市明倫高等学校', '金沢桜丘高等学校', '石川県立工業高等学校', '金沢錦丘高等学校 ']
university = ['金沢医科大学', '石川県立大学', '金沢工業大学', '金沢星稜大学', '金沢大学', '北陸大学', '北陸学院大学']

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

  user.educational_backgrounds.build({
    school_name: elder_school.sample,
    joined_at: (birthday.year + 7).to_s + '-04-01',
    quited_at: (birthday.year + 13).to_s + '-03-30'
  })

  user.educational_backgrounds.build({
    school_name: junior_high_school.sample,
    joined_at: (birthday.year + 13).to_s + '-04-01',
    quited_at: (birthday.year + 16).to_s + '-03-30'
  })

  user.educational_backgrounds.build({
    school_name: high_school.sample,
    joined_at: (birthday.year + 16).to_s + '-04-01',
    quited_at: (birthday.year + 19).to_s + '-03-30'
  })

  user.educational_backgrounds.build({
    school_name: university.sample,
    joined_at: (birthday.year + 19).to_s + '-04-01',
    quited_at: (birthday.year + 23).to_s + '-03-30'
  })

  user.work_experiences.build({
    company_name: company_name.sample,
    joined_at: (birthday.year + 23).to_s + '-04-01',
    quited_at: (birthday.year + 26).to_s + '-03-30'
  })

  user.work_experiences.build({
    company_name: company_name.sample,
    joined_at: (birthday.year + 26).to_s + '-04-01',
    quited_at: (birthday.year + 35).to_s + '-03-30'
  })

  if rand(5) == 0
    user.medical_histories.build({
      disease_name: 'ぜんそく',
      joined_at: (birthday.year + 7).to_s + '-03-21',
      quited_at: (birthday.year + 12).to_s + '-08-11',
    })
  end

  if rand(5) == 0
    user.medical_histories.build({
      disease_name: '骨折',
      joined_at: (birthday.year + 14).to_s + '-03-21',
      quited_at: (birthday.year + 14).to_s + '-05-11',
    })
  end

  if rand(20) == 0
    user.crime_histories.build({
      crime_name: '窃盗',
      crimed_at: (birthday.year + 24).to_s + '-08-21',
    })
  end



  if user.save
    p "Insert #{ user.name }"
  else
    p user.errors.full_messages
  end
end
