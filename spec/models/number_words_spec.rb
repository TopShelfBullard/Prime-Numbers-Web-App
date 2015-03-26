require "rails_helper"

RSpec.describe NumberWords, :type => :model do
  it "can turn '1' into 'one'" do
    expect(NumberWords.to_english(1)).to eq("one")
  end

  it "can turn '9' into 'nine'" do
    expect(NumberWords.to_english(9)).to eq("nine")
  end

  it "can turn '11' into 'eleven'" do
    expect(NumberWords.to_english(11)).to eq("eleven")
  end

  it "can turn '25' into 'twenty-five'" do
    expect(NumberWords.to_english(25)).to eq("twenty-five")
  end

  it "can turn '50' into 'fifty'" do
    expect(NumberWords.to_english(50)).to eq("fifty")
  end

  it "can turn '107' into 'one hundred seven'" do
    expect(NumberWords.to_english(107)).to eq("one hundred seven")
  end

  it "can turn '155' into 'one hundred fifty-five'" do
    expect(NumberWords.to_english(155)).to eq("one hundred fifty-five")
  end

  it "can turn '300' into 'three hundred'" do
    expect(NumberWords.to_english(300)).to eq("three hundred")
  end

  it "can turn '6602' into 'six thousand six hundred two'" do
    expect(NumberWords.to_english(6602)).to eq("six thousand six hundred two")
  end

  it "can turn '7000' into 'seven thousand'" do
    expect(NumberWords.to_english(7000)).to eq("seven thousand")
  end

  it "can turn '9583' into 'nine thousand five hundred eighty-three'" do
    expect(NumberWords.to_english(9583)).to eq("nine thousand five hundred eighty-three")
  end
end
