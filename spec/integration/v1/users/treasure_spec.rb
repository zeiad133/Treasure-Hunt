# frozen_string_literal: true

require 'swagger_helper'

describe 'Users API' do
  let(:user) { create(:user) }
  path '/v1/users/treasures/hunt' do
    post 'Hunt' do
      tags 'Treasure'
      consumes 'application/json'
      parameter name: :treasure, in: :body,schema: { type: :object, properties: {
        current_location: {
          type: :array,
          items: {
            type: :string
          }
        }
      }
    }
      let(:auth_headers) { user.create_new_auth_token }


      response '200', 'Request submitted' do
        let(:treasure) { {current_location: ['0', '0'] }}
        let(:client) { auth_headers['client'] }
        let(:token) { auth_headers['token'] }
        let(:uid) { auth_headers['uid'] }

        run_test!
      end


      response '422', 'invalid params' do
        let(:treasure) { [] }
        let(:client) { auth_headers['client'] }
        let(:token) { auth_headers['token'] }
        let(:uid) { auth_headers['uid'] }

        run_test!
      end

      response '401', 'not authorized' do
        let(:treasure) { ['0', '0'] }
        let(:client) { nil }
        let(:token) { nil }
        let(:uid) { nil }

        run_test!
      end
    end
  end

end
