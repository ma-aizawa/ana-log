# -*- encoding: utf-8 -*-
[
  {name: 'カタン', kana: 'かたん', description: '開拓するよ'},
  {name: 'ドミニオン', kana: 'どみにおん', description: '支配するよ'}
].reject{|game| Game.exists?(name: game[:name])}.each do |param|
  Game.create!(param)
end

User.create!(id: 1) unless User.exists?(id: 1)
User.create!(id: 9999) unless User.exists?(id: 9999)

Play.where(user_id: nil).find_each do |pl|
  pl.user_id = 1
  pl.save!
end
