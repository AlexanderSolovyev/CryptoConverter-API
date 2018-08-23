require 'rails_helper'

RSpec.describe HistoryController, type: :controller do

  context 'history#history' do
    before(:each) do
      item = FactoryBot.create_list(:history, 20)
    end

    it 'return 10 operations' do
      get :history
      res = JSON.parse(response.body)["ok"].count
      expect(res).to eq 10
    end

    it 'return last operations' do
      item2 = FactoryBot.create(:history, amount1: 'eur')
      get :history
      res = JSON.parse(response.body)["ok"]
      expect(res[-1]["amount1"]).to eq('eur')
    end

    it 'can return limit operations' do
      get :history, :params => { limit: 15 }
      res = JSON.parse(response.body)["ok"].count
      expect(res).to eq 15
    end
  end

end
