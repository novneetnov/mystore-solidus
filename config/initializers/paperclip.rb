Paperclip::Attachment.default_options[:storage] = :s3
Paperclip::Attachment.default_options[:s3_host_name] = "s3-#{ENV['AWS_REGION']}.amazonaws.com"
Paperclip::Attachment.default_options[:bucket] = "#{ENV['FOG_DIRECTORY']}"
Paperclip::Attachment.default_options[:access_key_id] = "#{ENV['AWS_ACCESS_KEY_ID']}"
Paperclip::Attachment.default_options[:secret_access_key] ="#{ENV['AWS_SECRET_ACCESS_KEY']}"
Paperclip::Attachment.default_options[:s3_region] = "#{ENV['AWS_REGION']}"
Paperclip::Attachment.default_options[:path] = "assets/spree/products/:id/:style/:basename.:extension'"
