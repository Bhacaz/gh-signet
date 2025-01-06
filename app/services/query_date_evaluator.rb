# frozen_string_literal: true

class QueryDateEvaluator
  REGEX = /\{(\d+)\.(day|days|week|weeks|month|months|year|years)\.ago}/.freeze
  # updated <= {7.days.ago}
  def self.call(query)
    query.gsub(REGEX) do
      date = $1.to_i
      unit = $2
      return query if date.zero? || unit.blank?

      date.public_send(unit).ago.to_date
    end
  end
end
