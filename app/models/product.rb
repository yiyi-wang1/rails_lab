class Product < ApplicationRecord

    RESERVED_NAME = ["Apple", "Microsoft", "Sony"]

    # callbacks
    after_initialize :set_price
    before_save :capitalize_title

    validates :title, presence: {message: "must be provided"}, uniqueness: { case_sensitive: false },
     exclusion: { in: %w(Apple Microsoft Sony), message: "%{value} is reserved." }
    validates :price, numericality: { greater_than: 0 }
    validates :description, presence: { message: "must be provided"}, length: { minimum: 10}
    # validates :sale_price, 

    # validate :no_words

    def self.search(keyword)
        where("title ILIKE ? OR description ILIKE ?", "%#{keyword}%","%#{keyword}%")
    end

    def self.search2(keyword)
        where("title ILIKE ?", "%#{keyword}%") + where("description ILIKE ?", "%#{keyword}%")
    end

    private

    def set_price
        self.price ||= 1
    end

    def capitalize_title
        self.title.capitalize!
    end

    def no_words
        RESERVED_NAME.each do |name|
            if title&.downcase&.include?(name.downcase)
                self.errors.add(:title, "Must not have #{name}")
            end
        end
       
    end
end
