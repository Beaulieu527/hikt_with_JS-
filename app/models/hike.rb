class Hike < ApplicationRecord
    has_many :reviews
    has_many :hikes, through: :reviews

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
