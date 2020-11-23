class Relationship < ApplicationRecord
    # Since there is neither a followed nor a follower model,
    # we need to supply the class name User

    belongs_to :follower, class_name: "User"
    belongs_to :followed, class_name: "User"
    validates :follower_id, presence: true
    validates :followed_id, presence: true

    #followed users
    # has_many :active_relationships, foreign_key: "follower_id",
    #                                 class_name: "Relationship",
    #                                 dependent: :destroy
    # has_many :followed_users, through: :active_relationships, source: :followed
    
end
