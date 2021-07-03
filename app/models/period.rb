class Period < ApplicationRecord
  validates :period, presence: true
  
  belongs_to :history
  enum period:{
    "幼少期": 0,
    "小学生時代": 1,
    "中学生時代": 2,
    "高校生時代": 3,
    "大学生時代": 4,
    "20代": 5,
    "30代": 6,
    "40代": 7,
    "50代": 8
  }
end
