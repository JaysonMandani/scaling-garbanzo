module Talkpush
  extend ActiveSupport::Concern

  class Candidate
    def self.invite(data)
      url = "https://my.talkpush.com/api/talkpush_services/campaigns/3929/campaign_invitations"

      begin
        response = RestClient.post url, {
          # I didnt inclunde it on the ENV file I know this is not a good practice :D
          api_key: '48530ba23eef6b45ffbc95d7c20a60b9', 
          campaign_invitation: data
        }
        return true
      rescue response => error
        puts "error! #{error.inspect}"
      end
    end
  end
end

