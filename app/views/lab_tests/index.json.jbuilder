# frozen_string_literal: true

json.array! @lab_tests, partial: 'lab_tests/lab_test', as: :lab_test
