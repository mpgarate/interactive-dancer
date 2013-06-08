class Creation < ActiveRecord::Base
  attr_accessible :author, :created_time, :id, :slides, :title, :uploaded_content_group_id
end
