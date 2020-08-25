FactoryBot.define do
    service_array = ["Test submission", "Test submission two"]

    factory :random_submission, class: Submission do
        firstname { Faker::Name.first_name }
        lastname { Faker::Name.last_name }
        email { Faker::Internet.email }
        slogan { Faker::Lorem.paragraph_by_chars(number: 50, supplemental: false) }
    end
end
