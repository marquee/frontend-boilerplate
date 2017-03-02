React = require 'react'

{
    Title
    Summary
    Byline
    DateTime
} = require 'proof-sdk/components'

makeEntryPreview = (entry, char_count=120) ->
    preview = entry.summary
    unless preview
        preview = entry.description
    unless preview
        for block in entry.content
            if block.role is 'paragraph'
                preview = block.content
                break
        if preview?.length > char_count
            preview = preview[0..char_count].split(' ')
            last_word = preview.pop()
            unless last_word[last_word.length - 1] in ['.','?','!','…']
                last_word = '…'
            preview.push(last_word)
            preview = preview.join(' ')

    return preview

module.exports = React.createClass
    displayName: 'EntryInfo'
    getDefaultProps: -> {
        level: 2
        include_summary: true
    }
    render: ->

        <div className='EntryInfo _Info'>
            <Title title=@props.entry.title link=@props.link level=@props.level />
            {
                if @props.include_summary
                    summary = @props.entry.summary
                    unless summary
                        summary = makeEntryPreview(@props.entry)
                    <Summary summary=summary />
            }
            {
                if @props.include_byline and @props.entry.author_person
                    <Byline byline=@props.entry.author_person.name />
            }
            {
                if @props.entry.release_date
                    <DateTime
                        date            = @props.entry.release_date
                        format          = 'MMMM Do YYYY'
                        title_format    = 'MMMM Do YYYY, h:mm:ss a'
                        relative        = {days: 90}
                    />
            }
        </div>