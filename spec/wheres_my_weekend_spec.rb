require 'spec_helper'
require 'pry'

describe WheresMyWeekend do
  let(:monday)    { Time.new(2016, 12, 19) }
  let(:tuesday)   { Time.new(2016, 12, 20) }
  let(:wednesday) { Time.new(2016, 12, 21) }
  let(:thursday)  { Time.new(2016, 12, 22) }
  let(:friday)    { Time.new(2016, 12, 23) }
  let(:saturday)  { Time.new(2016, 12, 24) }
  let(:sunday)    { Time.new(2016, 12, 25) }

  context 'Gem Version' do
    it 'has a version number' do
      expect(WheresMyWeekend::VERSION).not_to be nil
    end
  end

  context '#weekend_day?' do
    it { expect(monday.weekend_day?).to eq false }
    it { expect(tuesday.weekend_day?).to eq false }
    it { expect(wednesday.weekend_day?).to eq false }
    it { expect(thursday.weekend_day?).to eq false }
    it { expect(friday.weekend_day?).to eq false }
    it { expect(saturday.weekend_day?).to eq true }
    it { expect(sunday.weekend_day?).to eq true }
  end

  context '#any_weekend' do
    let(:week) { [monday, tuesday, wednesday, thursday, friday, saturday, sunday] }
    let(:business_days) { [monday, tuesday, wednesday, thursday, friday] }

    it { expect(week.any_weekend?).to eq true }
    it { expect(business_days.any_weekend?).to eq false }
  end

  context '#weekend_dates' do
    let(:week) { [monday, tuesday, wednesday, thursday, friday, saturday, sunday] }

    it { expect(week.weekend_dates.class).to eq Array }
    it { expect(week.weekend_dates).to eq [saturday, sunday] }
  end

  context '#next_saturday' do
    it { expect(monday.send(:next_saturday)).to eq Time.new(2016, 12, 24) }
    it { expect(tuesday.send(:next_saturday)).to eq Time.new(2016, 12, 24) }
    it { expect(wednesday.send(:next_saturday)).to eq Time.new(2016, 12, 24) }
    it { expect(thursday.send(:next_saturday)).to eq Time.new(2016, 12, 24) }
    it { expect(friday.send(:next_saturday)).to eq Time.new(2016, 12, 24) }

    it { expect(saturday.send(:next_saturday)).to eq Time.new(2016, 12, 31) }
    it { expect(sunday.send(:next_saturday)).to eq Time.new(2016, 12, 31) }
  end

  context '#last_saturday' do
    it { expect(monday.send(:last_saturday)).to eq Time.new(2016, 12, 17) }
    it { expect(tuesday.send(:last_saturday)).to eq Time.new(2016, 12, 17) }
    it { expect(wednesday.send(:last_saturday)).to eq Time.new(2016, 12, 17) }
    it { expect(thursday.send(:last_saturday)).to eq Time.new(2016, 12, 17) }
    it { expect(friday.send(:last_saturday)).to eq Time.new(2016, 12, 17) }
    it { expect(saturday.send(:last_saturday)).to eq Time.new(2016, 12, 17) }
    it { expect(sunday.send(:last_saturday)).to eq Time.new(2016, 12, 24) }
  end
end
