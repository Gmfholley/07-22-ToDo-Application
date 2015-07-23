module Login
  
  # sets the @password_encrypted parameter
  #
  # p - String of the user's typed password
  # 
  # returns the encrypted password as a String
  def password=(p)
    p_hash = encrypt_it_with_bcrypt(p)
    self.password_encrypted = p_hash
  end

  # encrypts the password
  #
  # returns the new password
  def encrypt_it_with_bcrypt(p)
    BCrypt::Password.create(p)
  end
  
  # returns boolean to indicate if a valid password and rescues BCrypt Hash errors
  #
  # returns a boolean
  
  def same_password?(p)
    begin
      (BCrypt::Password.new(self.password_encrypted) == p)
    rescue
      false
    end
  end
  
  # checks if this is a valid password and adds to errors if not
  #
  # returns a Boolean
  def valid_password?(p)
    if !same_password?(p)
      self.errors.messages["login"] = "Login Failed."
    end
    return self.errors.messages.empty?
  end  
  
end