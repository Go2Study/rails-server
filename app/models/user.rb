class User < ActiveRecord::Base
  
  self.primary_key = :pcn
  
  def to_json(options={})
    options[:except] ||= [:id, :created_at, :updated_at]
    super(options)
  end
  
end
