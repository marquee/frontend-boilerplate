React = require 'react'
Card  = require 'proof-sdk/components/Card'

EntryCover = require '../layouts/EntryCover.cjsx'


module.exports = React.createClass
    displayName: 'EntryCard'
    render: ->

        <Card className='EntryCard'>
            <EntryCover
                image = @props.entry.cover_image?.w(800)
                title = @props.entry.title
                link  = @props.entry.link
            />
        </Card>
