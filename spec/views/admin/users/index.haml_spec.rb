require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')

describe "/admin/users/index.html.haml" do
  include Admin::UsersHelper

  before(:each) do
    login_and_assign(:admin => true)
  end

  it "renders a list of users" do
    assign(:users, [ Factory(:user) ].paginate)
    view.should render_template(:partial => "_user")
    view.should render_template(:partial => "common/_paginate")
    render
  end
end
