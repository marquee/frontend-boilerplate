React = require 'react'

Base = require './_Base.cjsx'


Marquee = React.createClass
    displayName: 'Marquee'
    render: ->
        <div className='Marquee'>
            {
                @props.children.split(' ').map (word) ->
                    <span className='_Word'>
                        {
                            word.split('').map (letter) ->
                                top = Math.random() * 0.5
                                top = top * -1 if Math.random() > 0.5
                                rotate = 0
                                margin = 0
                                if Math.random() > 0.4
                                    rotate = Math.random() * 2
                                    rotate = rotate * -1 if Math.random() > 0.5
                                margin = Math.random() * 3
                                margin = margin * -1 if Math.random() > 0.5
                                <span
                                    className='_Letter'
                                    style={
                                        position: 'relative'
                                        display: 'inline-block'
                                        marginLeft: "#{ margin }px"
                                        top: "#{ top }px"
                                        transform: "rotate(#{ rotate }deg)"
                                        WebkitTransform: "rotate(#{ rotate }deg)"
                                    }
                                >{letter}</span>
                        }
                    </span>
            }
        </div>

module.exports = React.createClass
    displayName: 'NotFound'
    render: ->

        <Base
            title               = '404 Not Found'
        >
            <div className='NotFound__'>
                <div className='_Cover__'>
                    <Marquee>Oops nothing showing here</Marquee>
                </div>
                <div className='_Content__'>
                    <div className='_Column__'>
                        <p className='Prompt'>
                            Check out the <a href='/'>latest stories</a> from 
                            {global.config.PUBLICATION_TITLE} or learn about 
                            <a href='https://proof.pub'>Proof</a>.
                        </p>
                    </div>
                </div>
            </div>
        </Base>
