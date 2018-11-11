class Member < ApplicationRecord
  has_many :payments, dependent: :destroy
  include PgSearch
  pg_search_scope :search, against: [:firstName, :lastName, :active]

end
