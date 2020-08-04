module ListingsHelper

  def convert_to_currency(amount, currency_from, currency_to)
    eu_bank = EuCentralBank.new
    eu_bank.update_rates
    Money.default_bank = eu_bank
    new_value = Money.new(amount.to_i, currency_from).exchange_to(currency_to)
  end
end
