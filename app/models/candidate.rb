class Candidate < ApplicationRecord
  validates :email, uniqueness: true

  def self.access_spreadsheets
    session = GoogleDrive::Session.from_config("credentials.json")
    ws = session.spreadsheet_by_key("1xkofJa5iI3AQE4yWEoHqMTQ1QQ-VDsfUDDwV96QQDVM").worksheets[0]
  end

  def invite!
    data = attributes.except("id", "timestamp", "created_at", "updated_at")
    data["user_phone_number"] = data.delete "mobile"
    Talkpush::Candidate.invite(data)
  end

  def name
    "#{first_name} #{last_name}"
  end
end
