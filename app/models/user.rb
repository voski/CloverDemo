class User < ActiveRecord::Base
  validates :username, :password_digest, :session_token, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }

  has_many :auths

  attr_reader :password

  after_initialize :ensure_session_token

  def parse_clover_code code
    # token = o_auth_client.auth_code.get_token(code)
    # save_access_token token[:access_token]
    # token
    o_auth_client.auth_code.get_token(code)
  end

  def save_access_token token
    self.auths.save(auth_token: code, auth_type: "clover")
  end

  def get_clover_auth
    o_auth_client.auth_code.authorize_url(:redirect_uri => "https://clover-demo.herokuapp.com/clover/callback")
  end

  def o_auth_client
    OAuth2::Client.new(
      'VTEQFHAVMJ5FP',
      '1f51d805-6f92-2101-663c-0f5513654feb',
      :site => 'https://clover.com/',
      :token_method  => :get
    )
  end

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return nil unless user && user.valid_password?(password)
    user
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def valid_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def reset_token!
    self.session_token = SecureRandom.urlsafe_base64(16)
    self.save!
    self.session_token
  end

  private
  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64(16)
  end
end
