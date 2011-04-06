Warden::Manager.serialize_into_session do |user|
  user.id
end

Warden::Manager.serialize_from_session do |id|
  User.get(id)
end

Warden::Strategies.add(:password) do

  def valid?
    params[:username] && params[:password]
  end

  def authenticate!
    u = User.authenticate(params[:username], params[:password])
    u.nil? ? fail!("Could not log in") : success!(u)
  end
end