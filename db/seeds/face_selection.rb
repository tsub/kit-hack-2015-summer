p 'Start Face_Selection seed'

FaceSelection.create([
    { face_type_id: FaceType.find_by(kind: 'かっこいい').id, gender: 0, file_name: 'http://girlschannel.net/post_img/2013/01/gFLq2ipbIOOiFr1_kExIH_78.jpeg'},
    { face_type_id: FaceType.find_by(kind: 'かわいい').id, gender: 0, file_name: 'http://up.gc-img.net/post_img/2014/04/B87ynvRTZMuOLOq_3AXvh_19.jpeg'},
    { face_type_id: FaceType.find_by(kind: 'かわいい').id, gender: 1, file_name: 'http://everyday-e-news.com/wp-content/uploads/2014/07/201106070000001view.jpg'},
    { face_type_id: FaceType.find_by(kind: '個性的').id, gender: 0,file_name: 'http://ageha-news.blog.so-net.ne.jp/_images/blog/_385/ageha-news/news_thumb_iwao3.jpg'},
    { face_type_id: FaceType.find_by(kind: '個性的').id, gender: 1, file_name: 'http://livedoor.blogimg.jp/newshousejp/imgs/8/0/80da89cf.jpg'},
    { face_type_id: FaceType.find_by(kind: '中性的').id, gender: 0, file_name: 'http://ks.c.yimg.jp/res/chie-ans-217/217/004/320/i320'},
    { face_type_id: FaceType.find_by(kind: '中性的').id, gender: 1, file_name: 'http://ks.c.yimg.jp/res/chie-ans-268/268/976/149/i320'},
    { face_type_id: FaceType.find_by(kind: '男らしい').id, gender: 0, file_name: 'http://up.gc-img.net/post_img/2014/01/KhlddlnzUzxkd4K_C7DB1_270.jpeg'},
    { face_type_id: FaceType.find_by(kind: '濃い').id, gender: 0, file_name: 'http://everyday-e-news.com/wp-content/uploads/2014/05/762d830e000d38379671d087adeeee07.jpg'},
    { face_type_id: FaceType.find_by(kind: '濃い').id, gender: 1, file_name: 'http://up.gc-img.net/post_img/2012/12/vkdKzfJziMKIlTK_59RkR_28.jpeg'},
    { face_type_id: FaceType.find_by(kind: '薄い').id, gender: 0, file_name: 'http://magabon.yomiuri.co.jp/special/voice/common/images/photo248_01.jpg'},
    { face_type_id: FaceType.find_by(kind: '薄い').id, gender: 1, file_name: 'http://livedoor.blogimg.jp/halosoku/imgs/d/1/d1d3fbd2.jpg'},
    { face_type_id: FaceType.find_by(kind: 'セクシー').id, gender: 1, file_name: 'http://img.allabout.co.jp/gm/article/438105/topimg_large.jpg?FM=rssaa_latest-rbeauty'},
    { face_type_id: FaceType.find_by(kind: '知性的').id, gender: 0, file_name: 'http://眼鏡の選び方.xyz/wp-content/uploads/2013/10/1-m11.jpg'},
    { face_type_id: FaceType.find_by(kind: '知性的').id, gender: 1, file_name: 'http://28.media.tumblr.com/tumblr_lgw5b8Invx1qz9xbco1_400.jpg'},
    { face_type_id: FaceType.find_by(kind: 'ワイルド').id, gender: 0, file_name: 'http://wordleaf.c.yimg.jp/wordleaf/thepage/images/20140608-00000002-wordleaf/20140608-00000002-wordleaf-083a845e84f3d7432f42b1901edd94439.jpg'},
    { face_type_id: FaceType.find_by(kind: 'きれい').id, gender: 1, file_name: 'http://up.gc-img.net/post_img_web/2013/05/q24fw54FeP8k7Cs_0.jpeg'},
    { face_type_id: FaceType.find_by(kind: '人外').id, gender: 1, file_name: 'http://www.sakimura.org/wp-content/uploads/2014/08/myna-all-01.png'}
  ])
