module Login
  # BCrypt
  
  # run this to convert a password (if it is a password and not a hash) to a hash
  #
  # either converts the password or not if it is not a Hash
  after_initialize do |user|
    user.convert_password_if_necessary
  end

  # run this to convert a password (if it is a password and not a hash) to a hash
  #
  # either converts the password or not if it is not a Hash
  before_update do |user|
    user.convert_password_if_necessary
  end
  
  # run this to convert a password (if it is a password and not a hash) to a hash
  #
  # either converts the password or not if it is not a Hash
  def convert_password_if_necessary
    begin
      BCrypt::Password.new(password)
    rescue BCrypt::Errors::InvalidHash
      convert_password
    end
  end
  
  # encrypts the password
  #
  # returns the new password
  def convert_password
    self.password = BCrypt::Password.create(self.password)
  end
  
  # checks if this is a valid password
  #
  # returns a Boolean
  def valid_password?(password)
    if !(BCrypt::Password.new(self.password) == password)
      errors.messages["login"] = "Login Failed."
    end
    return errors.messages.empty?
  end  
  
end