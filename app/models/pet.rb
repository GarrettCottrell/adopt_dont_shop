# frozen_string_literal: true

class Pet < ApplicationRecord; validates_presence_of :name
belongs_to :shelter
end
