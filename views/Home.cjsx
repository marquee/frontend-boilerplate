React       = require 'react'

Base        = require './_Base.cjsx'
EntryList   = require '../layouts/EntryList'

module.exports = React.createClass
    displayName: 'Home'
    render: ->

        <Base page='Home'>
            <EntryList entries={@props.entries} />
        </Base>
