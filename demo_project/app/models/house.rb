class House < ActiveRecord::Base
  # self.abstract_class = true
  validates :address, presence: true
  has_many(
    :people,
    class_name: 'Person',
    foreign_key: :house_id,
    primary_key: :id
  )
end
