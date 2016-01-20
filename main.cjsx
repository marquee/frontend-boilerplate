React   = require 'react'
When    = require 'when'

Home    = require './views/Home.cjsx'
Entry   = require './views/Entry.cjsx'

module.exports = ({ api, emitFile, done }) ->

    When.all([
        api.entries()
    ]).then ([entries]) ->

        for entry in entries
            entry.link = "/stories/#{ entry.slug }.html"
            emitFile(entry.link, <Entry entry=entry />)

        emitFile('/index.html', <Home entries=entries />)

        done()
