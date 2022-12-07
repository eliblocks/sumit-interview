# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

liability_account = FactoryBot.create(:liability_account, name: 'Unearned Revenue')
cash_account = FactoryBot.create(:asset_account, name: 'Cash')

FactoryBot.create(
  :journal_entry,
  description: "My first journal entry",
  date: Date.yesterday,
  debits: [
    {
      account_name: 'Cash',
      amount: 1000.00
    }
  ],
  credits: [
    {
      account: liability_account,
      amount: 1000.00
    }
  ]
)
