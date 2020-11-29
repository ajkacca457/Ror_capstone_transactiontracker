class TransactionsController < ApplicationController
  before_action :set_transaction, only: %i[show edit update destroy]

  # GET /transactions
  # GET /transactions.json
  def index
    @transactions = Transaction.includes(:group).where(user_id: current_user).grouped
    @transaction_sum = Transaction.where(user_id:current_user).grouped.sum(:amount)
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
  end

  # GET /transactions/1/edit
  def edit; end

  # POST /transactions
  # POST /transactions.json
  def create
    @transaction = current_user.transactions.build(transaction_params)

    respond_to do |format|
      if @transaction.save
        if @transaction.group_id.nil?
          format.html do
            redirect_to '/etransactions',
                        notice: 'Transaction was successfully created.'
          end
        else
          format.html do
            redirect_to '/transactions',
                        notice: 'Transaction was successfully created.'
          end
        end
      else
        format.html { render :new }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        if @transaction.group_id.nil?
          format.html do
            redirect_to '/etransactions',
                        notice: 'Transaction was successfully created.'
          end
        else
          format.html do
            redirect_to '/transactions',
                        notice: 'Transaction was successfully created.'
          end
        end
      else
        format.html { render :edit }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction.destroy
    respond_to do |format|
      if @transaction.group_id.nil?
        format.html do
          redirect_to etransactions_url,
                      notice: 'Transaction was successfully destroyed.'
        end
      else
        format.html do
          redirect_to transactions_url,
                      notice: 'Transaction was successfully destroyed.'
        end

      end
    end
  end

  def etransaction
    @etransactions = Transaction.where(user_id:current_user).non_grouped
    @etransaction_sum = Transaction.where(user_id:current_user).non_grouped.sum(:amount)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def transaction_params
    params.require(:transaction).permit(:title, :amount, :user_id, :group_id)
  end
end
