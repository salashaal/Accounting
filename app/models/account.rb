class Account < ActiveRecord::Base
  belongs_to :user
  has_many :transactions, :dependent => :destroy
 attr_accessible :account_number, :account_type, :total_amount, :balance_type, :user
end
