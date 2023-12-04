class LoansController < ApplicationController
  before_action :set_loan, only: %i[show edit update destroy return_loan]

  # GET /loans or /loans.json
  def index
    @loans = Loan.all
  end

  # GET /loans/1 or /loans/1.json
  def show
  end

  # GET /loans/new
  def new
    @loan = Loan.new
  end

  # GET /loans/1/edit
  def edit
  end

  # POST /loans or /loans.json
  def create
    loan_quantity = loan_params[:quantity].to_i.abs
    @loan = Loan.new(loan_params.merge(loan_date: Date.today, quantity: loan_quantity))

    respond_to do |format|
      if @loan.valid?
        Book.transaction do
          if update_book_quantity(@loan.book, -@loan.quantity)
            @loan.save!
            format.html { redirect_to @loan, notice: 'Loan was successfully created.' }
            format.json { render :show, status: :created, location: @loan }
          else
            @loan.errors.add(:base, 'Error updating the quantity of books.')
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @loan.errors, status: :unprocessable_entity }
          end
        end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @loan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /loans/1 or /loans/1.json
  def update
    respond_to do |format|
      previous_quantity = @loan.quantity
  
      if @loan.returned?
        format.html do
          @loan.errors.add(:base, 'Cannot update a closed loan!')
          render :edit, status: :unprocessable_entity
        end
      else
        loan_updated = false
        
        Loan.transaction do
          loan_quantity = loan_params[:quantity].to_i.abs
          if @loan.update(loan_params.merge(quantity: loan_quantity))
            unless update_book_quantity(@loan.book, previous_quantity - @loan.quantity)
              @loan.errors.add(:base, 'Error updating the quantity of books.')
              raise ActiveRecord::Rollback
            end
  
            loan_updated = true
          else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @loan.errors, status: :unprocessable_entity }
          end
        end
  
        if loan_updated
          format.html { redirect_to @loan, notice: 'Loan was successfully updated.' }
          format.json { render :show, status: :ok, location: @loan }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @loan.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /loans/1 or /loans/1.json
  def destroy
    quantity_to_restore = @loan.quantity

    respond_to do |format|
      unless @loan.returned?
        unless update_book_quantity(@loan.book, quantity_to_restore)
          format.html { redirect_to loans_url, status: :unprocessable_entity, alert: 'Error updating the quantity of books.' }
          format.json { head :no_content }
          return
        end
      end

      @loan.destroy

      format.html { redirect_to loans_url, notice: 'Loan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # POST /loans/1/return_loan
  def return_loan
    unless @loan.returned?
      if @loan.return_loan
        unless update_book_quantity(@loan.book, @loan.quantity)
          redirect_to @loan, notice: 'Loan returned successfully, but there was an error updating the quantity of books.'
          return
        end

        redirect_to @loan, notice: 'Loan returned successfully.'
      else
        redirect_to @loan, alert: 'Error processing the return of the loan.'
      end
    end
  end

  private

  def set_loan
    @loan = Loan.find(params[:id])
  end

  def loan_params
    params.require(:loan).permit(:student_id, :book_id, :quantity, :loan_date, :return_date, :expected_return_date, :fine)
  end

  def update_book_quantity(book, quantity_change)
    new_quantity = book.quantity + quantity_change

    if new_quantity >= 0
      book.update!(quantity: new_quantity)
      true
    else
      false
    end
  rescue ActiveRecord::RecordInvalid => e
    puts "Error updating book quantity: #{e.message}"
    false
  end  
end
