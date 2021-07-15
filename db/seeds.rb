# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Period.create!(
  [
    {
     period: '幼少期'
    },
    {
     period: '小学校時代'
    },
    {
     period: '中学校時代'
    },
    {
     period: '高校時代'
    },
    {
     period: '大学時代'
    },
    {
     period: '20代'
    },
    {
     period: '30代'
    },
    {
     period: '40代'
    },
  ]
)