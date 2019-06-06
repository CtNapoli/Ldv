class Price < ApplicationRecord
    before_save :end_grater_or_equal_start?

    belongs_to :apartment

    validates :start, presence: true
    validates :end, presence: true
    validates :value, presence: true

    validate :end_grater_or_equal_start?

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
end
