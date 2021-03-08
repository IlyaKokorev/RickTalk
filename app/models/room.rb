class Room < ApplicationRecord
  before_create :generate_token, :set_name

  has_many :messages

  def to_param
    token
  end

  private

  def generate_token
    self.token = SecureRandom.hex(2)
  end

  def set_name
    self.name = "#{Faker::TvShows::RickAndMorty.location} #{rand(1..100)}"
  end
end
