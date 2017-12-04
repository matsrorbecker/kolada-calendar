{connect} = require 'refnux'
{div, h1, span, p} = require('react-elem').DOM

entryList = require './entrylist'

module.exports = connect (state) ->
    {entries, error, info} = state

    div className: 'container', ->
        h1 'Koladas publiceringskalender'

        if error
            div className: 'alert alert-danger', ->
                p error.message
        else
            div className: 'alert alert-info', ->
                p info

        entryList() if entries