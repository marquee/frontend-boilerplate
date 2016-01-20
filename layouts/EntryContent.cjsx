React = require 'react'

{
  renderEntryContent
} = require 'marquee-static-sdk/entry'

module.exports = React.createClass
    displayName: 'EntryContent'
    render: ->

        <div className='_EntryContent__'>
            { renderEntryContent(@props.content) }
        </div>
