React = require 'react'

{
  Cover
  Info
  Title
} = require 'marquee-static-sdk/components'

module.exports = React.createClass
    displayName: 'EntryCover'
    render: ->

        <div className='_EntryCover__'>
            <Cover link={ @props.link } image={ @props.image }>
                <Info>
                    <Title title={ @props.title } level={ @props.level } />
                </Info>
            </Cover>
        </div>
