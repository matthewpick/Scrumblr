describe SprintsController do
  before :each do
    @fake_sprint = Sprint.find(12);
  end
  it 'should make sprint data available to scrum board view' do
    expect(assigns(:current_sprint)).to eq @fake_sprint
    get :show{:id => 12}
  end
end
