module ApplicationHelper
  def title(value)
    unless value.nil?
      @title = "#{value} | Stglnk"
    end
  end
end
