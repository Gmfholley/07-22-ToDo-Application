module Login
  
  # sets the @password_encrypted parameter
  #
  # p - String of the user's typed password
  # 
  # returns the encrypted password as a String
  def password=(p)
    p_hash = encrypt_it_with_bcrypt(p)
    @password_encrypted = p_hash
  end
  
  # encrypts the password
  #
  # returns the new password
  def encrypt_it_with_bcrypt(password)
    BCrypt::Password.create(password)
  end
  
  # checks if this is a valid password
  #
  # returns a Boolean
  def valid_password?(password)
    if !(BCrypt::Password.new(self.password_encrypted) == password)
      self.errors.messages["login"] = "Login Failed."
    end
    return self.errors.messages.empty?
  end  
  
end