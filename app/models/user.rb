class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	devise :omniauthable, :omniauth_providers => [:facebook]
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :avatar, :provider, :uid, :fraternity_id

	has_attached_file :avatar, :styles => {:medium => '300x300', :thumb => '100x100'},
									  :default_url => :gravatar_url, :storage => :s3,
										:s3_credentials => S3_CREDENTIALS,
										:path => "/:style/:id/:filename"
	# attr_accessible :title, :body

	has_one :profile, :dependent => :destroy

	has_many :event_users
	has_many :comments
	has_many :attending_events, :through => :event_users, :source => :event

  belongs_to :fraternity

  def gravatar_url(default = '', size = 100)
		hash = Digest::MD5.hexdigest(email.downcase.strip)[0..31]
		"http://www.gravatar.com/avatar/#{hash}.jpg?size=#{size}&d=#{CGI::escape default}"
	end

  def self.find_or_create_by_facebook_oauth(auth)
		user = User.where(:provider => auth.provider, :uid => auth.uid).first

		unless user
			user = User.create!(
			provider: auth.provider,
			uid: auth.uid,
			email: auth.info.email,
			password: Devise.friendly_token[0,20]
		)
		end
		user
	end

	def name
		profile.fname + ' ' + profile.lname
	end

end
