require 'rails_helper'

RSpec.describe Room, type: :model do
	before do
		@room = create(:room)
	end

  it "部屋の作成" do
    expect(@room).to be_valid
  end
end
