# frozen_string_literal: true

class Shelter < ApplicationRecord
  has_many :pets, dependent: :destroy
end
