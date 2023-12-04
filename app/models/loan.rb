class Loan < ApplicationRecord
  belongs_to :student
  belongs_to :book

  before_save :calculate_and_update_fine

  def return_loan
    self.return_date = Date.today unless return_date?
    save
  end

  def returned?
    return_date.present?
  end

  def calculate_penalty
    return 0.0 unless expected_return_date.present?

    today = Date.today
    return_date_to_use = return_date.present? ? return_date : today

    if return_date_to_use > expected_return_date
      overdue_days = (return_date_to_use - expected_return_date).to_i
      penalty_per_day = 2.00
      penalty_amount = (overdue_days * penalty_per_day * quantity)
      return penalty_amount
    elsif today > expected_return_date
      overdue_days = (today - expected_return_date).to_i
      penalty_per_day = 2.00
      penalty_amount = (overdue_days * penalty_per_day * quantity)
      return penalty_amount
    end

    0.0
  end

  private
  def calculate_and_update_fine
    self.fine = calculate_penalty
  end
end
