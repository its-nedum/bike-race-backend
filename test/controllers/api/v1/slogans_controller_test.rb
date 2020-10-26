# frozen_string_literal: true

require 'test_helper'

module Api
    module V1
        class SlogansControllerTest < ActionDispatch::IntegrationTest

            test 'should return all submitted slogan' do
                # make a get a request
                get api_v1_slogans_path

                # the endpoint response must include data object
                assert_includes(@response.body, 'data')

                # get the status code from the response
               code = JSON.parse(@response.body)['code']

                # ensure that the status code is equal to 201 :Created
               assert_equal(code, 200)
               
               assert_response :success
            end

            test 'should create a slogan when all params are provided' do
                # prepare the slogan parameter
               slogan_params = {
                firstname: Faker::Name.first_name,
                lastname: Faker::Name.last_name,
                email: Faker::Internet.email,
                slogan: Faker::Lorem.paragraph_by_chars(number: 50, supplemental: false),
               }
                # make post request   
               post api_v1_slogans_path, params: slogan_params

                # the endpoint response must include data object
                assert_includes(@response.body, 'data')

                # get the status code from the response
               code = JSON.parse(@response.body)['code']
                # status code must be equal to 201 :Created
               assert_equal(code, 201)

               assert_response :success
            end


        end
    end
end