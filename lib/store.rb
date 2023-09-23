class Store < ActiveRecord::Base
  has_many :employees
  validates :name, presence: true, length: { minimum: 3 }
  validates :annual_revenue, numericality: { greater_than_or_equal_to: 0 }
  validate :carry_men_or_women


  def carry_men_or_women
    unless mens_apparel.present? || womens_apparel.present?
      errors.add(:base, "Store must carry men or women apparel")
    end
  end
end
