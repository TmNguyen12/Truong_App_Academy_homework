# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  band_id    :integer          not null
#  year       :integer          not null
#  live       :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ApplicationRecord
  belongs_to :band
  has_many :tracks, dependent: :destroy

  # can't use presence validation with boolean field
  validates :band, :name, :year, presence: true
  validates :live, inclusion: { in: [true, false] }
  validates :name, uniqueness: { scope: :band_id }
  validates :year, numericality: { minimum: 1900, maximum: 9000 }

  after_initialize :set_defaults

  def set_defaults
    self.live ||= false
  end
end
