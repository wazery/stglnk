ActionController::Renderers.add :csv do |obj, options|
  filename = options[:filename] || 'data'
  str = obj.respond_to?(:to_csv) ? obj.to_csv : obj.to_s
  send_data str, type: Mime::CSV, disposition: "attachment; filename=#{filename}.csv"
end

# Monkey patch the Array class to add to_csv support
class Array
  def to_csv(options = nil)
    return '' if empty?

    map { |obj| obj.to_csv if obj }.join("\n")
  end
end
