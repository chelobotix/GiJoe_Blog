module UsersHelper
  # Gravatar
  def gravatar(user, size = 200)
    email_address = user.email
    hash = Digest::MD5.hexdigest(email_address)
    "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
  end

  # Gijoe?
  def gijoe?(user)
    return true if user.faction == 'G.I. Joe'

    false
  end
end
