class User < ActiveRecord::Base # The User class is automatically mapped to the table named "users"
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  has_many :authentications, :dependent => :destroy
  belongs_to :profile, polymorphic: true
  has_merit # Users' Badges

  validates_associated :profile # do we need this? (profile is invalid appear only at provider?)

# Database Authenticatable: encrypts and stores a password in the database to validate the authenticity of a user while signing in. The authentication can be done both through POST requests or HTTP Basic Authentication.
# Token Authenticatable: signs in a user based on an authentication token (also known as "single access token"). The token can be given both through query string or HTTP Basic Authentication.
# Omniauthable: adds Omniauth (https://github.com/intridea/omniauth) support;
# Confirmable: sends emails with confirmation instructions and verifies whether an account is already confirmed during sign in.
# Recoverable: resets the user password and sends reset instructions.
# Registerable: handles signing up users through a registration process, also allowing them to edit and destroy their account.
# Rememberable: manages generating and clearing a token for remembering the user from a saved cookie.
# Trackable: tracks sign in count, timestamps and IP address.
# Timeoutable: expires sessions that have no activity in a specified period of time.
# Validatable: provides validations of email and password. It's optional and can be customized, so you're able to define your own validations.
# Lockable: locks an account after a specified number of failed sign-in attempts. Can unlock via email or after a specified time period.

  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :trackable, :validatable

  include RoleModel

  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, :last_name, :dob, :avatar, :email, :password, :password_confirmation, :remember_me, :provider, :uid, :roles

  has_attached_file :avatar, :styles => { :small => "100x100>", :thumb => "30x30>"}
  #validates :email, :password, :presence => true # All fields must not be empty
  #validates :email, :uniqueness => true # Email must be unique


  # Rolemodel gem 
  # Getting and setting the list of roles a user belongs to. 
  # This will perform the necessary bitwise operations 
  # to translate an array of roles into the integer field.
  ROLES = %w[admin provider member banned]

  def roles=(roles)
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
  end

  def roles
    ROLES.reject do |r|
      ((roles_mask || 0) & 2**ROLES.index(r)).zero?
    end
  end

  def is?(role)
    roles.include?(role.to_s)
  end



  def apply_omniauth(omni)
    authentications.build(:provider => omni['provider'], 
                          :uid => omni['uid'], 
                          :token => omni['credentials'].token, 
                          :token_secret => omni['credentials'].secret)
  end

  # Fetch the user with the given provider and uid
  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
    end
  end
    
  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end
  
  def password_required?
    (authentications.empty? || !password.blank?) && super #&& provider.blank?
  end
  
  
  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end
  
  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(  provider:auth.provider,
                           uid:auth.uid,
                           email:auth.info.email,
                           password:Devise.friendly_token[0,20]
                           )
    end
    user
  end


end
