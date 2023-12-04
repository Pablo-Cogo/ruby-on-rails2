require "application_system_test_case"

class LoansTest < ApplicationSystemTestCase
  setup do
    @loan = loans(:one)
  end

  test "visiting the index" do
    visit loans_url
    assert_selector "h1", text: "Loans"
  end

  test "creating a Loan" do
    visit loans_url
    click_on "New Loan"

    fill_in "Book", with: @loan.book_id
    fill_in "Expected return date", with: @loan.expected_return_date
    fill_in "Fine", with: @loan.fine
    fill_in "Loan date", with: @loan.loan_date
    fill_in "Quantity", with: @loan.quantity
    fill_in "Return date", with: @loan.return_date
    fill_in "Student", with: @loan.student_id
    click_on "Create Loan"

    assert_text "Loan was successfully created"
    click_on "Back"
  end

  test "updating a Loan" do
    visit loans_url
    click_on "Edit", match: :first

    fill_in "Book", with: @loan.book_id
    fill_in "Expected return date", with: @loan.expected_return_date
    fill_in "Fine", with: @loan.fine
    fill_in "Loan date", with: @loan.loan_date
    fill_in "Quantity", with: @loan.quantity
    fill_in "Return date", with: @loan.return_date
    fill_in "Student", with: @loan.student_id
    click_on "Update Loan"

    assert_text "Loan was successfully updated"
    click_on "Back"
  end

  test "destroying a Loan" do
    visit loans_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Loan was successfully destroyed"
  end
end
