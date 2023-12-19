module UsersHelper
  # Gijoe?
  def gijoe?(user)
    return true if user.faction == 'G.I. Joe'

    false
  end
end
