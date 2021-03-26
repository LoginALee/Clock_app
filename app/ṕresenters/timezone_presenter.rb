class TimezonePresenter < SimpleDelegator
  attr_reader :name, :info, :timezone, :data

  def initialize(timezone)
    @data = timezone
    @id = timezone.id
    @name = ActiveSupport::TimeZone[timezone.name].to_s
    @info = ActiveSupport::TimeZone[timezone.name].now.to_s
  end

  def as_json
    {
      id: @id,
      name: @name,
      info: @info,
      data: @data
    }
  end
end
