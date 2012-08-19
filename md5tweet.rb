# -*- coding: utf-8 -*-
require 'digest/md5'
Plugin.create(:md5tweet) do
  filter_command do |menu|
    menu[:md5tweet] = {
      :slug => :md5tweet,
      :name => "md5でつぶやく",
      :condition => lambda{|postbox| postbox.post.editable? },
      :exec => lambda{|postbox| 
        postbox.widget_post.buffer.text = Digest::MD5.hexdigest(postbox.widget_post.buffer.text)
        postbox.post_it },
      :visible => true,
      :role => :postbox
    }
    [menu]
  end
end
