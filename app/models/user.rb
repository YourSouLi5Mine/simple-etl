class User < ApplicationRecord
  validates :curp, :gender, presence: true
  validates :curp, uniqueness: true
  validates :curp, length: 18
  validates :gender, length: 1
end
