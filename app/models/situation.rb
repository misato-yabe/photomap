class Situation < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '自然・風景' },
    { id: 3, name: '街並み・建物' },
    { id: 4, name: '乗り物・交通' },
    { id: 5, name: '人物' },
    { id: 6, name: '動物' },
    { id: 7, name: '植物' },
    { id: 8, name: '食べ物・飲み物' },
    { id: 9, name: 'モノ・雑貨' },
    { id: 10, name: 'スポーツ' },
    { id: 11, name: '日本' },
    { id: 12, name: '世界' },
    { id: 13, name: 'イベント' },
    { id: 14, name: 'その他' }
  ]
  include ActiveHash::Associations
  has_many :photos
end