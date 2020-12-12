class Situation < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '--自然環境--' },
    { id: 3, name: '川・河川敷' },
    { id: 4, name: '海・池・沼・湖' },
    { id: 5, name: '山・森・林' },
    { id: 6, name: '草原・花畑・群生' },
    { id: 7, name: '滝・渓谷' },
    { id: 8, name: '朝日・夕焼け' },
    { id: 9, name: 'その他（自然環境）' },
    { id: 10, name: '--人工環境--' },
    { id: 11, name: '港・埠頭' },
    { id: 12, name: 'ダム・堤防' },
    { id: 13, name: '田園・畑・果樹園' },
    { id: 14, name: '夜景・ライトアップ' },
    { id: 15, name: '--建物--' },
    { id: 16, name: '史跡・名所' },
    { id: 17, name: '教会・寺院・神社' },
    { id: 18, name: '公園' },
    { id: 19, name: '学校' },
    { id: 20, name: '街並み・商店街' },
    { id: 21, name: 'ホテル・ラウンジ・結婚式場' },
    { id: 22, name: 'レジャー・テーマパーク' },
    { id: 23, name: '廃墟・倉庫・工場' },
    { id: 24, name: '建物（その他）' }
  ]
  include ActiveHash::Associations
  has_many :photos
end