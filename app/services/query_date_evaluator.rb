# frozen_string_literal: true

class QueryDateEvaluator
  AGO_REGEX = /\{(\d+)\.(day|days|week|weeks|month|months|year|years)\.ago}/.freeze
  BEGGING_OF_REGEX = /\{beginning_of_(day|week|month|year)}/.freeze

  def initialize(query)
    @query = query
  end

  def self.call(query)
    new(query).call
  end

  def call
    @query = parse_ago
    parse_beginning_of
  end

  private

    # updated <= {7.days.ago}
    def parse_ago
      @query.gsub(AGO_REGEX) do
        date = $1.to_i
        unit = $2
        return @query if date.zero? || unit.blank?

        date.public_send(unit).ago.to_date
      end
    end

  def parse_beginning_of
    @query.gsub(BEGGING_OF_REGEX) do
      unit = $1
      return @query if unit.blank?

      Time.current.public_send("beginning_of_#{unit}").to_date
    end
  end
end
