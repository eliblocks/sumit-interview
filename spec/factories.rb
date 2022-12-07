FactoryBot.define do
  factory :entity do
    name { Faker::Company.name }
  end

  factory :journal_entry, class: 'Plutus::Entry' do
  end

  factory :asset_account, class: 'Plutus::Asset' do
  end

  factory :liability_account, class: 'Plutus::Liability' do
  end
end
