React = require 'react'

{ renderEntryContent } = require 'proof-sdk/entry'
Base = require './_Base.cjsx'

{ CoverImage, Title, Summary, DateTime } = require 'proof-sdk/components'

EntryInfo = require '../components/EntryInfo.cjsx'
module.exports = React.createClass
    displayName: 'Entry'
    render: ->
        content = @props.entry.content
        content?.forEach (block) ->
            if block.type is 'text' and block.role is 'heading' and block.heading_level
                block.heading_level += 1
        cover_image = @props.entry.cover_image or @props.entry.cover_content
        <Base
            title               = @props.entry.title
            publication         = @props.publication
            links = {
                canonical: @props.entry.link
            }
            client_modules = {
                GalleryBlock    : []
                ImageBlock      : []
                ImageZoomer     : []
            }
        >
            <div className='Entry__' data-content_id=@props.entry.id>
                {
                    if cover_image
                        <div className='_Cover__'>
                            <div className='_Image__'>
                                <CoverImage image=cover_image intrinsic=false />
                            </div>
                        </div>
                }
                <div className='_Info__'>
                    <EntryInfo entry=@props.entry level=1 include_byline=true include_summary=false />
                </div>
                <div className='_Content__'>
                    {
                        if @props.entry.content?.map
                            renderEntryContent(content)
                    }
                </div>
            </div>
        </Base>