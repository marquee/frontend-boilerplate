Entry   = require './views/Entry.cjsx'
Home    = require './views/Home.cjsx'
React   = require 'react'
When    = require 'when'

# Only necessary if providing a feed for Facebook Instant Articles.
{ fbInstantArticlesRSSFeed } = require 'marquee-static-sdk/fb_instant_articles'

module.exports = ({ api, emitFile, emitRSS, done }) ->

    When.all([
        api.entries()
    ]).then ([entries]) ->

        for entry in entries
            entry.link = "/stories/#{ entry.slug }/"
            entry.full_link = "http://#{ config.HOST }#{ entry.link }"
            emitFile(entry.link, <Entry entry=entry />)

        emitFile('/index.html', <Home entries=entries />)

        emitRSS('/fb_instant_feed.xml', fbInstantArticlesRSSFeed(
            title: 'Instant Articles'
            entries: entries
        ))

        done()
