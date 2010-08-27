require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/accounts/_edit.html.haml" do
  include AccountsHelper

  before(:each) do
    login_and_assign
    assign(:account, @account = Factory(:account))
    assign(:users, [ @current_user ])
  end

  it "should render [edit account] form" do
    view.should_receive(:render).with(hash_including(:partial => "accounts/top_section"))
    view.should_receive(:render).with(hash_including(:partial => "accounts/contact_info"))
    view.should_receive(:render).with(hash_including(:partial => "accounts/permissions"))

    render
    rendered.should have_tag("form[class=edit_account]") do
      with_tag "input[type=hidden][id=account_user_id][value=#{@account.user_id}]"
    end
  end

  it "should render background info field if settings require so" do
    Setting.background_info = [ :account ]

    render
    rendered.should have_tag("textarea[id=account_background_info]")
  end

  it "should not render background info field if settings do not require so" do
    Setting.background_info = []

    render
    rendered.should_not have_tag("textarea[id=account_background_info]")
  end
end
