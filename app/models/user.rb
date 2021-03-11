class User < ApplicationRecord
  before_create :generate_nickname

  scope :online, -> { where(online: true) }

  def generate_nickname
    self.nickname = Faker::TvShows::RickAndMorty.character
  end
end
