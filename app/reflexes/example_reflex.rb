# frozen_string_literal: true

class ExampleReflex < ApplicationReflex
  # Add Reflex methods in this file.
  #
  # All Reflex instances expose the following properties:
  #
  #   - connection - the ActionCable connection
  #   - channel - the ActionCable channel
  #   - request - an ActionDispatch::Request proxy for the socket connection
  #   - session - the ActionDispatch::Session store for the current visitor
  #   - url - the URL of the page that triggered the reflex
  #   - element - a Hash like object that represents the HTML element that triggered the reflex
  #   - params - parameters from the element's closest form (if any)
  #
  # Example:
  #
  #   def example(argument=true)
  #     # Your logic here...
  #     # Any declared instance variables will be made available to the Rails controller and view.
  #   end
  #
  # Learn more at: https://docs.stimulusreflex.com

  def convert_currency
    listing = Listing.find(element.dataset[:id])
    selling_price = listing.selling_price
    currency = listing.currency

    new_currency = element[:value]

    @new_value = currency_exchange(selling_price,currency,new_currency).fractional
  end

  private

    def currency_exchange(amount, currency_from, currency_to)
      eu_bank = EuCentralBank.new
      eu_bank.update_rates
      Money.default_bank = eu_bank
      new_value = Money.new(amount.to_i, currency_from).exchange_to(currency_to)
    end
end
