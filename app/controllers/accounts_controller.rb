class AccountsController < ApplicationController
  before_filter :set_account, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index 
    @accounts = Account.all
    @accounts.each do |account|
      if (account.total_amount).nil?
        account.total_amount = 0
      else
      end
      if (account.balance_type).nil?
        account.balance_type = "N/A"
      else
      end
    end
    #@account_types = AccountType.find(params)
    #debugger
    #respond_with(@accounts)
  end

  def show
    respond_with(@account)
  end

  def new
    @account = Account.new
    respond_with(@account)
  end

  def edit
    @account = Account.find(params[:id])
  end
  
  def create
    #@account_type = Account.find(params[:account][:account_type_id]).account_type
    @account = Account.create!(params["account"])
    debugger
    flash[:notice] = "#{@account.account_number} was successfully created."
    redirect_to accounts_path
    #respond_with(@account)
    #redirect_to accounts_path
  end

  def update
    @account.update_attributes(params[:account_number])
    respond_with(@account)
  end

  def destroy
    
    @account.destroy
    respond_with(@account)
  end

  private
    def set_account
      @account = Account.find(params[:id])
    end
end
