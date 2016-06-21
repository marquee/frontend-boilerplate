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

        # A typical pattern is to first transform the incoming content objects,
        # generating links, applying references. This is especially important
        # when Packages and Entities are used, or when Entries reference other
        # Entries.
        entries.forEach (entry) ->
            entry.link      = "/stories/#{ entry.slug }/"
            entry.full_link = "http://#{ config.HOST }#{ entry.link }"
        


        # Once all the data is transformed, generate and emit the file content
        # for each link.

        entries.forEach (entry) ->
            emitFile(entry.link, <Entry entry=entry />)

        emitFile('/', <Home entries=entries />)

        emitRSS('/fb_instant_feed.xml', fbInstantArticlesRSSFeed(
            title: 'Instant Articles'
            entries: entries
        ))



        # Done MUST be called so the SDK can perform additional tasks, like
        # uploading the files during a deployment.
        done()
