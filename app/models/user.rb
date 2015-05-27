class User < ActiveRecord::Base
  validates :username, :password_digest, :session_token, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }

  attr_reader :password

  after_initialize :ensure_session_token

  def get_clover_auth
    callback_path = "#{Rails.application.routes.url_helpers.clover_path}/authorize"
    client = OAuth2::Client.new(
      'VTEQFHAVMJ5FP',
      '1f51d805-6f92-2101-663c-0f5513654feb',
      :site => 'https://clover.com/',
      :token_method  => :get
    )
    oauth_endpoint = client.auth_code.authorize_url(:redirect_uri => "#{callback_path}")
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
