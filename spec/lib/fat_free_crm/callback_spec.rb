require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

include FatFreeCRM::Callback::Helper
include ActionView::Helpers::CaptureHelper

# New style view hooks that accept blocks.
#------------------------------------------------------------------------------
module CallbackSpecHelper
  class TestCallback < FatFreeCRM::Callback::Base
    insert_before :test_before do |view, context|
      "BEFORE-"
    end

    insert_after :test_after do |view, context|
      "-AFTER"
    end

    replace :test_replace do |view, context|
      "REPLACE"
    end

    remove :test_remove

    insert_before :test_before_and_after do |view, context|
      "BEFORE-"
    end

    insert_after :test_before_and_after do |view, context|
      "-AFTER"
    end

    insert_before :test_before_and_after_with_replace do |view, context|
      "BEFORE-"
    end

    insert_after :test_before_and_after_with_replace do |view, context|
      "-AFTER"
    end

    replace :test_before_and_after_with_replace do |view, context|
      "REPLACED"
    end

  end

  def test_hook(position)
    Haml::Engine.new(%Q^
= hook(:test_#{position}, ActionView::Base.new) do
  BLOCK^).render.gsub("\n",'')
  end
end

# Old style view hooks.
#------------------------------------------------------------------------------
module LegacyCallbackSpecHelper
  class LegacyTestCallback < FatFreeCRM::Callback::Base
    def test_legacy_after(view, context = {})
      "legacy"
    end
  end

  def test_legacy_hook(position)
    Haml::Engine.new(%Q^
= hook(:test_legacy_#{position}, ActionView::Base.new)^).render.gsub("\n",'')
  end
end

#------------------------------------------------------------------------------
describe FatFreeCRM::Callback do
  describe "View Hooks" do
    include CallbackSpecHelper
    include LegacyCallbackSpecHelper

    it "should insert content before the block" do
      test_hook(:before).should == "BEFORE-BLOCK"
    end

    it "should insert content after the block" do
      test_hook(:after).should == "BLOCK-AFTER"
    end

    it "should replace the content of the block" do
      test_hook(:replace).should == "REPLACE"
    end

    it "should remove the block" do
      test_hook(:remove).should == ""
    end

    it "should be able to insert content before and after the block" do
      test_hook(:before_and_after).should == "BEFORE-BLOCK-AFTER"
    end

    it "should be able to insert content before and after a replaced block" do
      test_hook(:before_and_after_with_replace).should == "BEFORE-REPLACED-AFTER"
    end

    it "should render legacy hooks" do
      test_legacy_hook(:after).should == "legacy"
    end
  end
end

