# Bing's photo of the day background widget for ubersicht.

command: """
curl -s 'http://www.bing.com/HPImageArchive.aspx?format=xml&idx=0&n=1&mkt=ja-JP' | grep -E -m 1 -o '<url>(.*)</url>' | sed -e 's,.*<url>\([^<]*\)</url>.*,\#{1},g'
"""

# Set the refresh frequency.
refreshFrequency: '1h'

style: """
  top: 0%
  left: 0%
  color: #fff

  .wallpaper
    position: absolute
    z-index: -10000
    width: 100%

  .background
    width: 100%
    position: absolute
    z-index: -10000

  .myimage
    width: 1680px
    height: 1028px
    position: absolute
    z-index: -10000
"""

render: -> """
<div id='background'></div>
<div class='darker'></div>
"""

# Update the rendered output.
update: (output, domEl) ->
  mydiv = $(domEl).find('#background')
  html = ''
  outputhtml = output.replace("<url>", "").replace("</url>", "").replace(/(?:\r\n|\r|\n)/g, '').trim()
  html += "<div class='wallpaper'> "
  html += "<img src='http://www.bing.com" +outputhtml+ "' class='myimage' >"
  html += "</div>"

  # Set the output.
  mydiv.html(html)

# Sizes:
# Laptop w 1680 h 1028
# Desktop w 1920 h 1058

# Languages:
# mkt=de-DE
# mkt=en-AU
# mkt=en-CA
# mkt=en-GB
# mkt=en-IN
# mkt=en-NZ
# mkt=en-US
# mkt=fr-FR
# mkt=ja-JP
# mkt=pt-BR
# mkt=zh-CN
