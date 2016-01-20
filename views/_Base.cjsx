React   = require 'react'

{
    Asset
    Favicon
    GoogleFonts
} = require 'marquee-static-sdk/base'

module.exports = React.createClass
    displayName: 'Base'
    render: ->

        <html>
            <head>
                <title>Marquee SDK Example</title>

                <Asset path='style.sass' />

                <GoogleFonts fonts={
                    'Abril Fatface': [400]
                    'Gentium Book Basic': [400,700]
                    'Open Sans': [300,400,700]
                }/>

                <Favicon name='images/favicon.ico' />
            </head>
            <body className="Site__ #{ @props.page }__">
                {@props.children}

                <Asset path='script.coffee' />
            </body>
        </html>
