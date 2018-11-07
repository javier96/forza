class Member < ApplicationRecord
  has_many :payments
  include PgSearch
  pg_search_scope :search, against: [:firstName, :lastName]

end
