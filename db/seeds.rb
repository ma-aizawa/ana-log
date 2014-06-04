# -*- encoding: utf-8 -*-
# [
#   {name: 'カタン', kana: 'かたん', description: '開拓するよ'},
#   {name: 'ドミニオン', kana: 'どみにおん', description: '支配するよ'}
# ].reject{|game| Game.exists?(name: game[:name])}.each do |param|
#   Game.create!(param)
# end

require 'digest/sha1'

%w(Review Play User).each do |model|
  model.constantize.all.each(&:destroy)
end
User.create!(id: 2, user_id: 'guest', key_phrase: 'guest') unless User.exists?(id: 2)
User.create!(id: 1, user_id: 'admin', key_phrase: 'admin') unless User.exists?(id: 1)

# Play.where(user_id: nil).find_each do |pl|
#   pl.user_id = 1
#   pl.save!
# end
