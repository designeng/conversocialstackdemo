`define([
    'backbone'
],
function(Backbone){`

class EmailCollection extends Backbone.Collection
    
    initialFetch: ->
        @fetch()

    parse: (response) ->
        return response.mails

return EmailCollection

`})`
