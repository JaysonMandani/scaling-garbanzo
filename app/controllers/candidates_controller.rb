class CandidatesController < ApplicationController
  def index
    @candidates = Candidate.all.order('created_at DESC')
  end

  def invite
    sheets = Candidate.access_spreadsheets

    if sheets.num_rows > 1
      last_row = sheets.rows.last
      candidate = Candidate.create(timestamp: last_row[0], first_name: last_row[1], last_name: last_row[2], email: last_row[3], mobile: last_row[4])
      if candidate.errors.any?
        redirect_to candidates_path, flash: { error: 'Candidate was already invited' }
      else
        candidate.invite!
        redirect_to candidates_path, flash: { success: 'Candidate was successfully invited' }
      end
    else
      redirect_to candidates_path, flash: { error: 'No new candidates found!' }
    end
  end
end
