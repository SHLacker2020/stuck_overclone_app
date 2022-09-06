# == Schema Information
#
# Table name: votes
#
#  id           :bigint           not null, primary key
#  votable_type :string           not null
#  votes_number :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer          not null
#  votable_id   :integer          not null
#
# Indexes
#
#  index_votes_on_user_id                                  (user_id)
#  index_votes_on_user_id_and_votable_id_and_votable_type  (user_id,votable_id,votable_type) UNIQUE
#  index_votes_on_votable_id_and_votable_type              (votable_id,votable_type)
#
class Vote < ApplicationRecord
  
  validates :user_id, uniqueness: { scope: [:votable_id, :votable_type] }

  belongs_to :votable, 
    polymorphic: true
  
  belongs_to :user, 
    inverse_of: :votes

end
