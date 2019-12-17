class Address < ApplicationRecord
  belongs_to :user, optional: true # optionalにて外部キーをスルー
end
