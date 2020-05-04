# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 楽器のカテゴリー

# ヘッドホン/イヤホン
phones = Category.create(name: "ヘッドホン/イヤホン")

# 子カテゴリー
phones_head = phones.children.create(name: "ヘッドホン")
phones_ear = phones.children.create(name: "イヤホン")
speaker = phones.children.create(name: "スピーカー")

# 孫カテゴリー
phones_head.children.create([{name: "モニター"}, {name: "Bluetooth"}, {name: "リスニング"},{name: "その他"}])
phones_ear.children.create([{name: "モニター"}, {name: "Bluetooth"}, {name: "リスニング"},{name: "その他"}])
speaker.children.create([{name:"スタジオモニター"},{name: "ワイアレススピーカー"},{name: "スマートスピーカー"},{name: "その他"}])

# マイク
microphone = Category.create(name: "マイク")

# 子カテゴリー
microphone_dynamics = microphone.children.create(name: "ダイナミクスマイク")
microphone_condenser = microphone.children.create(name: "コンデンサーマイク")
microphone_other = microphone.children.create(name: "その他")

# 孫カテゴリー
microphone_dynamics.children.create([{name: "ボーカル用"},{name: "楽器用"},{name: "その他"}])
microphone_condenser.children.create([{name: "ラージダイアフラム"},{name: "スモールダイアフラム"},{name: "その他"}])
microphone_other.children.create([{name: "ビデオカメラ用"},{name: "レコーダー"},{name: "スマートフォン用"}])

# ギター
guitar = Category.create(name: "ギター")

# 子カテゴリー
guitar_electric = guitar.children.create(name: "エレキギター")
guitar_acoustic = guitar.children.create(name: "アコースティックギター")
guitar_amp = guitar.children.create(name: "ギターアンプ")
guitar_effector = guitar.children.create(name: "エフェクター ")
guitar_other = guitar.children.create(name: "その他")

# 孫カテゴリー
guitar_electric.children.create([{name: "ストラトキャスタータイプ"},{name: "テレキャスタータイプ"},{name: "レスポールタイプ"},{name: "ジャズマスタータイプ"},{name: "ムスタング/ジャガータイプ"},{name:"変形ギター"},{name: "その他エレキギター"}])
guitar_acoustic.children.create([{name: "アコースティックギター"},{name: "エレアコ"},{name: "クラシックギター"},{name: "エレクトリックガットギター"},{name: "その他ギター"}])
guitar_amp.children.create([{name: "ギターアンプ(コンボ)"},{name: "ギターアンプ(ヘッド)"},{name: "ギターキャビネット"},{name: "プリアンプ"},{name: "パワー・アンプ"},{name: "その他アンプ"}])
guitar_effector.children.create([{name: "歪み系"},{name: "空間系"},{name: "揺らし系（モジュレーション）"},{name: "ダイナミクス系"},{name: "フィルター系"},{name: "アンプ系"},{name: "ハーモニー系"},{name: "ボリューム系"},{name: "マルチエフェクター"},{name: "その他"}])
guitar_other.children.create([{name: "ギターケース"},{name: "アクセサリ"},{name:"ギター弦"},{name: "ピック"},{name: "その他"}])

# ベース
bass =  Category.create(name: "ベース")

# 子カテゴリー
bass_children = bass.children.create(name: "エレキベース")
bass_amp = bass.children.create(name: "ベースーアンプ")
bass_effector = bass.children.create(name: "エフェクター ")
bass_other = bass.children.create(name: "その他")

# 孫カテゴリー
bass_children.children.create([{name: "ジャズベース"},{name: "プレシジョンベース"},{name: "アクティブ"},{name: "フレットレス"},{name: "ウッドベース"},{name:"変形ベース"},{name: "その他ベース"}])
bass_amp.children.create([{name: "ベースアンプ(コンボ)"},{name: "ベースアンプ(ヘッド)"},{name: "ベースキャビネット"},{name: "その他アンプ"}])
bass_effector.children.create([{name: "歪み系"},{name: "空間系"},{name: "揺らし系（モジュレーション）"},{name: "ダイナミクス系"},{name: "フィルター系"},{name: "アンプ系"},{name: "ハーモニー系"},{name: "ボリューム系"},{name: "マルチエフェクター"},{name: "その他"}])
bass_other.children.create([{name: "ベースケース"},{name: "アクセサリ"},{name:"ベース弦"},{name: "ピック"},{name: "その他"}])

#パーカッション
percussion = Category.create(name: "打楽器")

# 子カテゴリー
percussion_drums = percussion.children.create(name: "ドラム")
percussion_percus = percussion.children.create(name: "パーカッション")
percussion_other = percussion.children.create(name: "その他")

# 孫カテゴリー
percussion_drums.children.create([{name: "ドラムセット"},{name: "電子ドラムセット"},{name: "スネア"}, {name: "シンバル"}, {name: "フットべダル"},{name: "スティック"},{name: "その他"}])
percussion_percus.children.create([{name: "コンガ"},{name: "ボンゴ"},{name: "カホン"},{name: "和太鼓"},{name: "ジャンベ"},{name: "ティンバレス"},{name: "その他パーカッション"}])
percussion_other.children.create([{name: "ケース"},{name: "アクセサリ"},{name: "その他アクセサリ"}])

#キーボード/鍵盤楽器
keyborad = Category.create(name: "鍵盤楽器")

# 子カテゴリー
piano = keyborad.children.create(name: "ピアノ")
keyborad_other = keyborad.children.create(name: "その他鍵盤楽器")

# 孫カテゴリー
piano.children.create([{name: "グランドピアノ"},{name: "アプライトピアノ"},{name: "その他"}])
keyborad_other.children.create([{name: "電子ピアノ"},{name: "シンセサイザー"},{name: "エレクトーン"},{name: "オルガン"},{name: "アコーディオン"}, {name: "その他"}])

# 木管楽器
inst = Category.create(name: "オーケストラ/吹奏楽")

# 子カテゴリー
ww_wind_inst = inst.children.create(name: "木管楽器")
br_wind_inst = inst.children.create(name: "金管楽器")
strignsed_inst = inst.children.create(name: "弦楽器")

# 孫カテゴリー
ww_wind_inst.children.create([{name: "ピッコロ"},{name: "フルート"},{name: "オーボエ"},{name:"クラリネット"},{name: "バリトン"},{name: "ファゴット/バスーン"},{name: "その他"}])
br_wind_inst.children.create([{name: "ホルン"},{name: "トランペット"},{name: "トロンボーン"},{name: "チューバ"},{name: "ユーフォニアム"},{name: "その他"}])
strignsed_inst.children.create([{name: "ヴァイオリン"},{name: "ヴィオラ"},{name: "チェロ"},{name: "コントラバス"},{name: "マンドリン"},{name: "その他"}])

# その他楽器
other = Category.create(name: "その他楽器")

# 子カテゴリー
ethnic = other.children.create(name: "エスニック楽器")
other_elec = other.children.create(name: "その他電子楽器")
other_equip = other.children.create(name: "その他周辺機器")
other_inst = other.children.create(name: "その他楽器")

# 孫カテゴリー
ethnic.children.create([{name: "弦楽器"},{name: "管楽器"},{name: "鍵盤楽器"},{name: "打楽器"},{name: "その他"}])
other_elec.children.create([{name: "DJ"},{name: "サンプラー"},{name: "テルミン"},{name: "その他電子楽器"}])
other_equip.children.create([{name: "DTM/DAW"},{name: "ラック/ケース"},{name: "スタンド/アタッチメント"},{name: "ケーブル"},{name: "その他"}])
other_inst.children.create([{name: "その他楽器"},{name: "その他の相棒"}])
