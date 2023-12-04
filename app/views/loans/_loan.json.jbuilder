json.extract! loan, :id, :student_id, :book_id, :quantity, :loan_date, :return_date, :expected_return_date, :fine, :created_at, :updated_at
json.url loan_url(loan, format: :json)
