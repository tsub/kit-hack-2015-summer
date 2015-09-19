require 'date'

from = Date.parse('1950/01/01')
to   = Date.parse('1997/12/31')

company_name = ['SONY', '任天堂', 'ネクスト', 'DMM', 'さくらインターネット', 'GMOグローバルサイン', '金沢エンジニアリングシステムズ', '富士通']

hobbies = ['油絵', '編み物', 'イラスト', '歌', 'エアブラシ',
          '映画撮影', '江戸切子', '折り紙', '回路作成', '紙飛行機',
          'アニメ', 'ゲーム', '野球', 'サッカー', 'テニス', '山登り',
          'プログラミング']

my_type = ['かっこいい', '個性的', '中性的', '男らしい', '濃い', '薄い', '知性的', 'ワイルド']
preference_type = ['セクシー', '個性的', '中性的', 'かわいい', '濃い', '薄い', '知性的', 'きれい']

avater = ['https://www.pakutaso.com/shared/img/thumb/150711039221_TP_V1.jpg',
          'https://www.pakutaso.com/shared/img/thumb/SEPsts_TP_V.jpg',
          'https://www.pakutaso.com/shared/img/thumb/0I9A105515030124meganechira_TP_V.jpg',
          'https://www.pakutaso.com/shared/img/thumb/DB88_jacketdebu15162752_TP_V.jpg',
          'https://www.pakutaso.com/shared/img/thumb/MAX77_syoumeisyashin20140531092514_TP_V.jpg',
          'https://www.pakutaso.com/shared/img/thumb/PAK42_udewokumubiz20131223_TP_V1.jpg',
          'http://sengyousyufu.net/wp-content/uploads/2014/10/SDS_ookawajinbeirokuro500-thumb-750x500-1366.jpg',
          'https://www.pakutaso.com/blog/shared/img/blog/mikarika_congratulations01.jpg',
          'http://www.amt-display.com/images/goods/New-tbu12074-cCg36.jpg',
          'http://imgbp.hotp.jp/CSP/IMG_SRC/18/40/B008261840/B008261840_262-349.jpg',
          'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSrNwv8xd7KIGXRLRwzcgwQcYTZdmmmq22S5HSbMPc_bCIocGbMLg',
          'http://imgbp.hotp.jp/CSP/IMG_SRC/00/27/B005680027/B005680027_164-219.jpg',
          'http://free-photos-ls04.gatag.net/images/lgf01a201411241100.jpg',
          'http://free-photos-ls04.gatag.net/thum01/gf01a201503312000.jpg',
          'http://img01t1.cc-library.net/box02/1024-cc-library010007334.jpg']

elder_school = ['野々市小学校', '御園小学校', '菅原小学校', '富陽小学校', '館野小学校']
junior_high_school = ['野々市中学校', '布水中学校']
high_school = ['金沢泉丘高等学校', '金沢向陽高等学校', '野々市明倫高等学校', '金沢桜丘高等学校', '石川県立工業高等学校', '金沢錦丘高等学校 ']
university = ['金沢医科大学', '石川県立大学', '金沢工業大学', '金沢星稜大学', '金沢大学', '北陸大学', '北陸学院大学']

1.upto(40) do |i|
  face_type_id = FaceType.find_by(kind: my_type.sample).id
  birthday = Random.rand(from .. to)
  user = User.create(
    {
      my_number: i.to_s,
      name: Gimei.male.kanji,
      birthdate: birthday,
      address: Gimei.address.kanji,
      hobby: hobbies.sample,
      gender: 0,
      avatar: avater.sample,
      face_type_id: face_type_id
    }
  )

  user.preference_faces.build(face_type_id: FaceType.find_by(kind: preference_type.sample).id)

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

