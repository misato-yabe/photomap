class Camera < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'キャノン(Canon)' },
    { id: 3, name: 'ニコン(Nikon)' },
    { id: 4, name: 'ソニー(SONY)' },
    { id: 5, name: '富士フイルム(FUJIFILM)' },
    { id: 6, name: 'パナソニック(Panasonic)' },
    { id: 7, name: 'オリンパス(OLYMPUS)' },
    { id: 8, name: 'ペンタックス(PENTAX)' },
    { id: 9, name: 'シグマ(SIGMA)' },
    { id: 10, name: 'ライカ(Leica)' },
    { id: 11, name: 'スマートフォン' },
    { id: 12, name: 'その他' }
  ]
  include ActiveHash::Associations
  has_many :photos
end