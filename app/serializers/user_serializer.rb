class UserSerializer
  include JSONAPI::Serializer

  attributes :email, :api_key

  def self.verification_failed
    {  "message": "Invalid credentials; please try again."  }
  end
end
