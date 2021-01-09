# frozen_string_literal: true

json.array! @prices, partial: 'prices/price', as: :price
