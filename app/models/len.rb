class Len < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'ズーム' },
    { id: 3, name: '単焦点' },
    { id: 4, name: 'マクロ' },
    { id: 5, name: '標準ズーム' },
    { id: 6, name: '望遠ズーム' },
    { id: 7, name: '広角ズーム' }
  ]
  include ActiveHash::Associations
  has_many :photos
end