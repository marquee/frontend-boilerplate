###
This is the Base for views. It should not be emitted by itself, rather used as
a wrapper around the view content. It provides the boilerplate markup for an
HTML document.
###

React   = require 'react'

{
    makeMetaTags
    Favicon
    GoogleFonts
    Asset
    ActivateClientModules
} = require 'proof-sdk/base'
{ GoogleAnalytics } = require 'proof-sdk/base/analytics'


Header = React.createClass
    displayName: 'Header'
    render: ->
        <header className='Header'>
            <nav>
                <a href='/'>{@props.title}</a>
            </nav>
        </header>


module.exports = React.createClass
    displayName: 'Base'
    getDefaultProps: -> {
        className           : ''
        links               : {}
        noindex             : false
        title               : null
        publication_title   : ''
        client_modules      : {}
        show_header         : true
    }
    render: ->
        client_modules = {
            CoverImage: []
        }
        client_modules[k] = v for k,v of @props.client_modules

        <html>
            <head>
                <title>{ if @props.title then "#{ @props.title } - " else null }{global.config.PUBLICATION_TITLE} | Powered by Proof</title>
                <meta charSet='utf-8' />
                <meta name='viewport' content='width=device-width, initial-scale=1, minimum-scale=1.0' />

                {
                    if @props.noindex
                        <meta name='robots' content='noindex, nofollow, noarchive' />
                }

                {
                    if @props.links.canonical
                        <link rel='canonical' href=@props.links.canonical />
                }
                {
                    if @props.links.next
                        <link rel='next' href=@props.links.next />
                }
                {
                    if @props.links.prev
                        <link rel='prev' href=@props.links.prev />
                }
                {
                    if @props.links.rss
                        <link rel='alternate' type='application/rss+xml' title=global.config.PUBLICATION_TITLE href="/feed.xml" />
                }
                <GoogleFonts fonts={
                    'Roboto'    : [500,100,300,'500italic','100italic','300italic']
                    'Lora'      : [400,700,'400italic','700italic']
                }/>
                <Asset path='style.css' />
                <link rel='icon' type='image/x-icon' href='/favicon.ico' />
                {@props.extra_head}

            </head>
            <body className="Site__ -#{ @props.page } #{ @props.className }" data-slug=@props.slug data-page=@props.page>
                <div className='_SiteHeader__'>
                    {
                        if @props.show_header
                            <Header title=global.config.PUBLICATION_TITLE />
                    }
                </div>
                <div className='_SiteContent__'>
                    {@props.children}
                </div>
                <Asset path='script.coffee' inline=true />
                <ActivateClientModules modules=client_modules immediate=true />
            </body>
        </html>