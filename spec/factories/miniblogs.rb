FactoryBot.define do
  factory :miniblog do
    title       {"title"}
    text        {"text"}
    association :user

    after(:build) do |miniblog|
      miniblog.images.attach(io: File.open('public/images/before.png'), filename: 'before.png')
      miniblog.images.attach(io: File.open('public/images/after.png'), filename: 'after.png')
    end
  end
end
