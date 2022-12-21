# Dirty hack to make record identification work with STI.

class Account < ApplicationRecord
  self.table_name = "plutus_accounts"
end
