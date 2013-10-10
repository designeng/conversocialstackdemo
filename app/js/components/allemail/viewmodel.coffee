`define([
    'knockout',
    'knockback'
],
function(ko, kb){`

class EmailList 
    # constructor: (@element) ->

    testFunction: () ->
        @emails = kb.collectionObservable(@emailCollection)

    clicked: (viewModel, event) =>

return EmailList


`})`