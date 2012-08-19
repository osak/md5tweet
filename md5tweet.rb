# -*- coding: utf-8 -*-
require 'digest/md5'
Plugin.create(:md5tweet) do
  filter_command do |menu|
    menu[:md5tweet] = {
      :slug => :md5tweet,
      :name => "md5でつぶやく",
      :condition => lambda{|postbox| postbox.post.editable? },
      :exec => lambda{|postbox| 
        org_text = postbox.widget_post.buffer.text
        reply, body = org_text.match(/^\s*(@[a-zA-Z0-9_]+)?\s*(.*)$/).captures
        hash = Digest::MD5.hexdigest(body)
        postbox.widget_post.buffer.text = "#{reply} #{hash}"
        postbox.post_it },
      :visible => true,
      :role => :postbox
    }
    [menu]
  end
end
