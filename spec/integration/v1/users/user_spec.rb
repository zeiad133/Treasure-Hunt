# frozen_string_literal: true

require 'swagger_helper'

describe 'Users API' do
  path '/v1/users' do
    post 'Creates User' do
      tags 'Users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string },
          password: { type: :string },
          password_confirmation: { type: :string },
        },
        required: %w(email password password_confirmation),
      }

      response '201', 'User created' do
        let(:client) {}
        let(:token) {}
        let(:uid) {}
        let(:user) do
          {
            email: 'valid@email.com',
            password: 'password',
            password_confirmation: 'password',
          }
        end
        run_test!
      end

      response '422', 'invalid request' do
        let(:is_social) {}
        let(:user) { { email: 'fooooo' } }
        let(:client) {}
        let(:token) {}
        let(:uid) {}
        run_test!
      end
    end
  end

  path '/v1/users/sign_in' do
    post 'Authenticate a User' do
      tags 'Users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string },
          password: { type: :string },
        },
        required: %w(email password),
      }

      response '401', ' wrong username or password' do
        let(:user) { { email: 'invalid@email.com' } }
        let(:client) {}
        let(:token) {}
        let(:uid) {}
        run_test!
      end
    end
  end
end
