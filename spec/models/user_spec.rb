require File.dirname(__FILE__) + "/../spec_helper"

describe User do

  describe 'em validações de unicidade' do
    before(:each) do
      Factory :user
    end
    it { should validate_uniqueness_of(:login) }
  end

  describe 'em validações de numericalidade' do
    it { should validate_numericality_of(:height) }
  end

  describe 'em validações de obrigatoriedade' do
    it { should validate_presence_of(:login)}
    it { should validate_presence_of(:email)}
  end

  describe 'em validações de confirmação' do
    it { should validate_confirmation_of(:password)}
  end

  describe 'em validações de formato' do
    it { should allow_values_for(:email, "cmilfont@gmail.com") }
    it { should_not allow_values_for(:email, "cmilfontgmail.com") }
    it { should allow_values_for(:password, "12345") }
    it { should validate_length_of(:password, :message => "Mínimo de 6 caracteres") }
  end

  describe 'em validações de métodos' do
    before :each do
      @user = Factory :user
      Factory :weight, :weight => 98.5, :user => @user
      Factory :weight_goal, :weight => 98.5, :user => @user
    end
    it "Último peso" do
      @user.last_weight.weight.to_f.should eql 98.5
    end
    it "Último objetivo de peso" do
      @user.last_weight_goal.weight.to_f.should eql 98.5
    end
    it "deve estar ativo" do
      @user.active?.should eql true
    end
  end

end

