{connect} = require 'refnux'
{div, table, thead, tbody, th, tr, td} = require('react-elem').DOM

module.exports = connect (state) -> div ->
    {entries} = state

    table className: 'table table-hover table-responsive', ->
        thead ->
            tr ->
                th 'Id'
                th 'Titel'
                th 'Publiceringsdatum'
                th 'Avser'
        tbody ->
            entries.map (entry) ->
                tr ->
                    td entry.id
                    td title: entry.description,entry.title
                    td entry.publication_date
                    td entry.publ_period