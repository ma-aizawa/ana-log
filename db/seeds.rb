# -*- encoding: utf-8 -*-
[
  {name: 'カタン', kana: 'かたん', description: '開拓するよ'},
  {name: 'ドミニオン', kana: 'どみにおん', description: '支配するよ'}
].reject{|game| Game.exists?(name: game[:name])}.each do |param|
  Game.create!(param)
end

User.create!(id: 9999)
