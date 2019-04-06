class User < ApplicationRecord
  validates :curp, :gender, presence: true
  validates :curp, uniqueness: true
  validates :curp, length: { is: 18 }
  validates :gender, length: { is: 1 }
end
