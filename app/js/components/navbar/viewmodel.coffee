`define([
    'knockout',
    'backbone'
],
function(ko, Backbone){`

class EmailList 
    # constructor: (@element) ->

    constructor: () ->
        @selectedItem = ko.observable(null)
        @menuItems = ko.observableArray([
            {name: 'All Email', url: '/#', value: ''},
            {name: 'Archive', url: '#archive', value: 'archive'}
            ])
    
    changeRoute: (vars) ->
        @selectedItem(vars[0])

return EmailList


`})`