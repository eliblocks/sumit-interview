module AccountsHelper
  def account_types_select
    Plutus::Account.types.map { |type| [type.to_s.split("::").last ,type.to_s] }
  end
end
