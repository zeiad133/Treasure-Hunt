require 'rails_helper'

RSpec.describe(V1::Users::TreasuresController, type: :controller) do
  let(:user) {create(:user)}
  before { sign_in_user(user) }


  describe 'valid params' do
    context 'when user sent valid location' do
      it 'succeed and return correct distance' do
        post :hunt, params: { current_location: ['19.945704', "50.0513227"] }
        expect(response).to be_successful
        expect(json[:distance]).to eq(6)
      end
    end

    context 'when user found the treasure' do
      before do
        expect(UserMailer).to receive(:send_treasure_details).and_return(double(UserMailer, deliver_now: nil))
      end
      it 'succeed and return correct distance' do
        post :hunt, params: { current_location: ['19.945704', "50.0513127"] }
        expect(response).to be_successful
        expect(json[:distance]).to eq(5)
        expect(json[:msg]).to eq('Congratulations An email will be sent to you with the treasure details')

      end
    end
  end

  describe 'Invalid params' do
    context 'when current location is missing' do
      it 'fails and return correct errors' do
        post :hunt, params: { current_location: [] }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(json[:errors]).to eq('please enter a valid location')
      end
    end
    context 'when current location contains non decimal values' do
      it 'fails and return correct errors' do
        post :hunt, params: { current_location: ['1', "a"] }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(json[:errors]).to eq('lng must be decimal')
      end
    end

    context 'when current location length is more than 2' do
      it 'fails and return correct errors' do
        post :hunt, params: { current_location: ['1', '2', '3'] }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(json[:errors]).to eq('Location must consist of lat & lng only')
      end
    end

    context 'when user has already found the treasure' do
      before do
        user.update(treasure_found: true)
      end
      it 'fails and return correct errors' do
        post :hunt, params: { current_location: ['1', '2'] }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(json[:errors]).to eq('You have already found the treasure')
      end
    end
  end

end