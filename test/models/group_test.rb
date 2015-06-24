require "test_helper"

describe Group do
  should validate_presence_of(:name)
  should validate_length_of(:name).is_at_least(3)
end
