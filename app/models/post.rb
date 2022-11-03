class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
    validate :title_bait
    # validate :title_bait?


    # TITLE_BAIT = [
    #     /Won't Believe/i,
    #     /Secrets/i,
    #     /Top \d/i,
    #     /Guess/i
    # ]

    # def title_bait?
    #     if TITLE_BAIT.none? {|pat| pat.match title}
    #         errors.add(:title, "Must be clickbait")
    #     end
    # end


    def title_bait
        if title === "True Facts"
            errors.add(:title, "Nope won't allow it")
        end
    end
end
