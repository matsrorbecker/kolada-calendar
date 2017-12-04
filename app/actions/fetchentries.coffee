$ = require 'jquery'
moment = require 'moment'

setEntries = (entries) -> ->
    {entries, info: "Visar #{entries.length} kalenderposter"}

setError = (error = null) -> ->
    {error}

module.exports = (state, dispatch) ->
    yesterday = moment().subtract 1, 'day'

    # Fetch all KPI:s
    $.ajax {url: 'http://api.kolada.se/v2/kpi?title='}
    .done (data) ->
        entries = data?.values?.filter (entry) ->
            # Entries before today is not of interest
            due = entry.publication_date or entry.prel_publication_date
            moment(due).isAfter yesterday
        .sort (a, b) ->
            # Most current entires first
            aDue = a.publication_date or a.prel_publication_date
            bDue = b.publication_date or b.prel_publication_date
            moment(aDue) - moment(bDue)
        console.log entries[0]
        dispatch setEntries entries
    .fail (jqXHR, textStatus) ->
        message = 'Kunde inte hämta kalenderposter... :('
        dispatch setError {message}
        console.error message, textStatus
    {info: 'Hämtar Kalenderposter...'}