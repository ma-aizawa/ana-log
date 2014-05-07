# -*- encoding: utf-8 -*-
[
  {name: 'カタン', kana: 'かたん', description: '開拓するよ'},
  {name: 'ドミニオン', kana: 'どみにおん', description: '支配するよ'}
].each do |param|
  Game.create!(param)
end

