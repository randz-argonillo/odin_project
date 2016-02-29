class Author < ActiveRecord::Base
  has_many :articles

  authenticates_with_sorcery!
  validates_confirmation_of :password, message: "should match with the confirmation", if: :password
end
