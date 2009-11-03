class User < ActiveRecord::Base

  has_many :workouts
  has_many :weights

  def last_weight
    @weight = Weight.last(:conditions => {:user_id => self.id})
    @weight.weight if @weight
  end

  acts_as_authentic do |c|
    c.validate_login_field = false
    c.validate_email_field = true
    c.openid_required_fields = [:email, "http://axschema.org/contact/email",
                                :nickname, "http://axschema.org/namePerson/friendly"
    ]
    c.openid_optional_fields = ["email","nickname"]
  end

  private

  def map_openid_registration(registration)
    self.email = registration["email"]
    self.login = registration["nickname"]
  end

end

