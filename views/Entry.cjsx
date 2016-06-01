React   = require 'react'

Base            = require './_Base.cjsx'
EntryCover      = require '../layouts/EntryCover.cjsx'
EntryContent    = require '../layouts/EntryContent.cjsx'

module.exports = React.createClass
    displayName: 'Entry'
    render: ->

        <Base page='Entry'>
            <EntryCover
                level = "1"
                title = { @props.entry.title }
                image = { @props.entry.cover_image?.w(1280) }
            />
            <EntryContent content={ @props.entry.content } />
        </Base>
