class Price < ApplicationRecord
    attr_accessor :skip_save 
    before_save :end_grater_or_equal_start?
    before_save :end_grater_or_equal_start_for_offer?

    belongs_to :apartment

    validates :start, presence: true, unless: :skip_save
    validates :end, presence: true, unless: :skip_save
    validates :value, presence: true, unless: :skip_save

    validates :price_offer_start, presence: true, unless: :skip_save
    validates :price_offer_end, presence: true, unless: :skip_save
    validates :price_offer_value, presence: true, unless: :skip_save

    validate :end_grater_or_equal_start?
    validate :end_grater_or_equal_start_for_offer?

    def start_and_end_exist?
        self.start.present? && self.end.present?
    end
    

    def end_grater_or_equal_start?
        self.errors.add(:start, :start_greater_end) if self.start >= self.end if start_and_end_exist?
    end

    def range_already_exist?(apartment)
        if start_and_end_exist?
            apartment.prices.each do |p|
                if (self.start..self.end).overlaps?(p.start..p.end)
                    self.errors.add(:start, :range_already_exist)
                    return true
                end
            end
            return false
        end
    end

    def start_and_end_exist_for_offer?
        self.price_offer_start.present? && self.price_offer_end.present?
    end
    

    def end_grater_or_equal_start_for_offer?
        self.errors.add(:price_offer_start, :start_greater_end) if self.price_offer_start >= self.price_offer_end if start_and_end_exist_for_offer?
    end

    def range_already_exist_for_offer?(apartment)
        if start_and_end_exist_for_offer?
            apartment.prices.each do |p|
                if (self.price_offer_start..self.price_offer_end).overlaps?(p.price_offer_start..p.price_offer_end)
                    self.errors.add(:start, :range_already_exist_for_offer)
                    return true
                end
            end
            return false
        end
    end
end
