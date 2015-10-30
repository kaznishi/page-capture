casper = require('casper').create()

# アクセスするURL
links = [
  'http://example.com/',
]

casper.start().each links, (self, link) ->
  self.thenOpen link, (response) ->
    split_split = link.split("/");
    # /images/に、[ドメイン].png の形式で保存
    if response.status == 200
      self.capture( './images/' + split_split[2] + '.png' )
    else
      this.echo link + ',' + response.status

casper.run()
