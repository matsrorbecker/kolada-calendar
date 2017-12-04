{createElement} = require 'react'
{render} = require 'react-dom'
{createStore, Provider} = require 'refnux'

app = require './components/app'
store = window.store = createStore require './model'
store.dispatch require './actions/fetchentries'

document.addEventListener 'DOMContentLoaded', ->
    render createElement(Provider, {store, app}), document.querySelector('#app')