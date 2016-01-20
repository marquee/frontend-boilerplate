React       = require 'react'
EntryCard   = require '../components/EntryCard.cjsx'

module.exports = React.createClass
    displayName: 'EntryList'
    render: ->

        <div className='_EntryList__'>
            {
                for entry in @props.entries
                    <EntryCard entry={entry} key={entry.id} />
            }
        </div>
