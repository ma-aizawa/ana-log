# -*- encoding: utf-8 -*-
# [
#   {name: 'カタン', kana: 'かたん', description: '開拓するよ'},
#   {name: 'ドミニオン', kana: 'どみにおん', description: '支配するよ'}
# ].reject{|game| Game.exists?(name: game[:name])}.each do |param|
#   Game.create!(param)
# end

require 'digest/sha1'

User.all.each(&:destroy)
User.create!(id: 0, user_id: 'guest', key_phrase: Digest::SHA1.hexdigest('guest')) unless User.exists?(id: 0)
User.create!(id: 1, user_id: 'admin', key_phrase: Digest::SHA1.hexdigest('admin')) unless User.exists?(id: 1)

# Play.where(user_id: nil).find_each do |pl|
#   pl.user_id = 1
#   pl.save!
# end
