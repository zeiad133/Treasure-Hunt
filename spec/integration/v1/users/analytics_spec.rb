# frozen_string_literal: true

require 'swagger_helper'

describe 'Users API' do
  let(:user) { create(:user) }
  let(:treasure) {create(:treasure)}
  path '/v1/users/analytics' do
    get 'Index' do
      tags 'Analytics'
      consumes 'application/json'
      parameter name: :page, in: :query, type: :string
      parameter name: :per_page, in: :query, type: :string
      parameter name: :start_time, in: :query, type: :date
      parameter name: :end_time, in: :query, type: :date
      parameter name: :radius, in: :query, type: :date,  description: 'All requests withing radius range in Kms'

      let(:auth_headers) { user.create_new_auth_token }


      response '200', 'Requests fetched' do
        before do
          treasure
        end
        let(:page) { 1 }
        let(:per_page) { 1 }
        let(:start_time) { '1/1/2020' }
        let(:end_time) { '1/2/2020' }
        let(:radius) { 1.0 }

        let(:client) { auth_headers['client'] }
        let(:token) { auth_headers['token'] }
        let(:uid) { auth_headers['uid'] }

        run_test!
      end

      response '401', 'not authorized' do
        let(:page) { 1 }
        let(:per_page) { 1 }
        let(:start_time) { '1/1/2020' }
        let(:end_time) { '1/2/2020' }
        let(:radius) { 1 }

        let(:client) { nil }
        let(:token) { nil }
        let(:uid) { nil }

        run_test!
      end
    end
  end

end
