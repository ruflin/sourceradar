require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe RulesController do

  # This should return the minimal set of attributes required to create a valid
  # Rule. As you add validations to Rule, be sure to
  # adjust the attributes here as well.
  # Also noteworthy: Everything here is a string, because it comes from a form submitted by the user. That turns everything into a string
  let(:valid_attributes) { { expression: "test", businessnote: "test", technicalnote:"test", language_id:"1", type_of_rule_id:"1"} }
  let(:invalid_attributes) { { description: "test"} }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # RulesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all rules as @rules" do
      rule = Rule.create! valid_attributes
      get :index, {}, valid_session
      assigns(:rules).should eq([rule])
    end
  end

  describe "GET show" do
    it "assigns the requested rule as @rule" do
      rule = Rule.create! valid_attributes
      get :show, {:id => rule.to_param}, valid_session
      assigns(:rule).should eq(rule)
    end
  end

  describe "GET new" do
    it "assigns a new rule as @rule" do
      get :new, {}, valid_session
      assigns(:rule).should be_a_new(Rule)
    end
  end

  describe "GET edit" do
    it "assigns the requested rule as @rule" do
      rule = Rule.create! valid_attributes
      get :edit, {:id => rule.to_param}, valid_session
      assigns(:rule).should eq(rule)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Rule" do
        expect {
          post :create, {:rule => valid_attributes}, valid_session
        }.to change(Rule, :count).by(1)
      end

      it "assigns a newly created rule as @rule" do
        post :create, {:rule => valid_attributes}, valid_session
        assigns(:rule).should be_a(Rule)
        assigns(:rule).should be_persisted
      end

      it "redirects to the created rule" do
        post :create, {:rule => valid_attributes}, valid_session
        response.should redirect_to(Rule.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved rule as @rule" do
        # Trigger the behavior that occurs when invalid params are submitted
        Rule.any_instance.stub(:save).and_return(false)
        post :create, {:rule => valid_attributes }, valid_session
        assigns(:rule).should be_a_new(Rule)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Rule.any_instance.stub(:save).and_return(false)
        post :create, {:rule => valid_attributes}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested rule" do
        rule = Rule.create! valid_attributes
        # Assuming there are no other rules in the database, this
        # specifies that the Rule created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Rule.any_instance.should_receive(:update_attributes).with(valid_attributes.with_indifferent_access)
        put :update, {:id => rule.to_param, :rule => valid_attributes}, valid_session
      end

      it "assigns the requested rule as @rule" do
        rule = Rule.create! valid_attributes
        put :update, {:id => rule.to_param, :rule => valid_attributes}, valid_session
        assigns(:rule).should == rule
      end

      it "redirects to the rule" do
        rule = Rule.create! valid_attributes
        put :update, {:id => rule.to_param, :rule => valid_attributes}, valid_session
        response.should redirect_to(rule)
      end
    end

    describe "with invalid params" do
      it "assigns the rule as @rule" do
        rule = Rule.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Rule.any_instance.stub(:save).and_return(false)
        put :update, {:id => rule.to_param, :rule => valid_attributes}, valid_session
        assigns(:rule).should eq(rule)
      end

      it "re-renders the 'edit' template" do
        rule = Rule.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Rule.any_instance.stub(:save).and_return(false)
        put :update, {:id => rule.to_param, :rule => valid_attributes}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested rule" do
      rule = Rule.create! valid_attributes
      expect {
        delete :destroy, {:id => rule.to_param}, valid_session
      }.to change(Rule, :count).by(-1)
    end

    it "redirects to the rules list" do
      rule = Rule.create! valid_attributes
      delete :destroy, {:id => rule.to_param}, valid_session
      response.should redirect_to(rules_url)
    end
  end

end
