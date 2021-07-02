class List < ApplicationRecord
  belongs_to :user
  has_many :list_games, dependent: :destroy
  validates :title, presence: true
  validates :public, presence: true
end