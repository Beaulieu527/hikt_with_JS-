class Hike < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews
    belongs_to :user, optional: true
    validates :name, presence: true
    validates :summary, presence: true
    validates :location, presence: true
    validates :length, presence: true
    
    def self.search(search)
        if search
            where('name LIKE ?', "%#{search}%").order("created_at DESC")
        else
            order("created_at DESC")
        end
    end

    def self.import(data)
        trails = data["trails"].map do |hash|
            hike = Hike.new
            attributes = hash.select do |key, value|
                hike.respond_to?(key)
            end
            hike.update(attributes)
            hike
        end
    end
end
