React = require 'react'

Base = require './_Base.cjsx'

{
    Cover
    Title
    Summary
    Info
    Card
} = require 'marquee-static-sdk/components'

MarqueeBranding = require 'marquee-static-sdk/components/MarqueeBranding'
DateTime = require 'marquee-static-sdk/components/DateTime'
CoverImage = require 'marquee-static-sdk/components/CoverImage'
EntryInfo = require '../components/EntryInfo.cjsx'
{ Classes } = require 'shiny'

EntryCard = React.createClass
    displayName: 'EntryCard'
    render: ->
        cx = new Classes('EntryCard')
        cx.set('link')
        cover_image = @props.entry.cover_image or @props.entry.cover_content
        if cover_image
            cx.set('has_cover')
        <Card className=cx>
            {
                if cover_image
                    <div className='_Image'>
                        <CoverImage image=cover_image link=@props.entry.link />
                    </div>
            }
            <EntryInfo entry=@props.entry link=@props.entry.link />
        </Card>

Pagination = React.createClass
    displayName: 'Pagination'
    render: ->
        <div className='Pagination'>
            <a
                className   = '_Link -previous'
                href        = @props.pagination.previous_link
            >{@props.pagination.previous_count} newer</a>
            <a
                className   = '_Link -next'
                href        = @props.pagination.next_link
            >{@props.pagination.next_count} older</a>
        </div>


module.exports = React.createClass
    displayName: 'Index'
    getDefaultProps: -> {
        pagination: {}
    }
    render: ->
        <Base
            publication     = @props.publication
            links = {
                prev        : @props.pagination.previous_link
                next        : @props.pagination.next_link
                canonical   : @props.pagination.current_link
                rss         : true
            }
            show_header = false
            page        = 'index'
        >
            <div className='EntryList__'>
                <div className='_Cover__'>
                    <CoverImage className='PublicationCover' image=null intrinsic=false>
                        <Info>
                            <Title level=1 title=global.config.PUBLICATION_TITLE />
                            <Summary summary=global.config.PUBLICATION_SUMMARY />
                            <MarqueeBranding fill='#ffffff' />
                        </Info>
                    </CoverImage>
                </div>
                <div className='_List__'>
                    <ul className='_Items__'>
                        {
                            @props.entries.map (entry) ->
                                <li className='_Entry__' key=entry.id>
                                    <EntryCard
                                        entry   = entry
                                    />
                                </li>
                        }
                    </ul>
                    <div className='_Pagination__'>
                        <Pagination pagination=@props.pagination />
                    </div>
                    <div className='_Branding__'>
                        <MarqueeBranding fill='#000000' />
                    </div>
                </div>
            </div>
        </Base>