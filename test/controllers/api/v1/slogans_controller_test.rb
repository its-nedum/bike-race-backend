# frozen_string_literal: true

require 'test_helper'

module Api
    module V1
        class SlogansControllerTest < ActionDispatch::IntegrationTest

            test 'user submit slogan' do
               slogan_params = {
                firstname: Faker::Name.first_name,
                lastname: Faker::Name.last_name,
                email: Faker::Internet.email,
                slogan: Faker::Lorem.paragraph_by_chars(number: 50, supplemental: false),
               }

               post '/api/v1/slogans', params: slogan_params 
               assert_response :success
            end

        end
    end
end