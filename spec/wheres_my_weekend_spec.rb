require 'spec_helper'

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

  context '#weekend?' do
    it { expect(monday.weekend?).to eq false }
    it { expect(tuesday.weekend?).to eq false }
    it { expect(wednesday.weekend?).to eq false }
    it { expect(thursday.weekend?).to eq false }
    it { expect(friday.weekend?).to eq false }
    it { expect(saturday.weekend?).to eq true }
    it { expect(sunday.weekend?).to eq true }
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

  context '#next_weekend' do
    it { expect(monday.next_weekend).to eq [Time.new(2016, 12, 24), Time.new(2016, 12, 25)] }
    it { expect(tuesday.next_weekend).to eq [Time.new(2016, 12, 24), Time.new(2016, 12, 25)] }
    it { expect(wednesday.next_weekend).to eq [Time.new(2016, 12, 24), Time.new(2016, 12, 25)] }
    it { expect(thursday.next_weekend).to eq [Time.new(2016, 12, 24), Time.new(2016, 12, 25)] }
    it { expect(friday.next_weekend).to eq [Time.new(2016, 12, 24), Time.new(2016, 12, 25)] }
    it { expect(saturday.next_weekend).to eq [Time.new(2016, 12, 31), Time.new(2017, 1, 1)] }
    it { expect(sunday.next_weekend).to eq [Time.new(2016, 12, 31), Time.new(2017, 1, 1)] }
  end

  context '#remove_weekends' do
    let(:week) { [monday, tuesday, wednesday, thursday, friday, saturday, sunday] }

    it { expect(week.remove_weekends.class).to eq Array }
    it { expect(week.remove_weekends).to eq [monday, tuesday, wednesday, thursday, friday] }
  end
end
