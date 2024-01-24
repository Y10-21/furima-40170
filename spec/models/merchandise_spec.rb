require 'rails_helper'

RSpec.describe Merchandise, type: :model do
  before do
    @merchandise = FactoryBot.build(:merchandise)
  end

end
