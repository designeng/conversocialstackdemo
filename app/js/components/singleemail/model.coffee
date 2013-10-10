`define([
    'backbone'
],
function(Backbone){`

class singleEmail extends Backbone.Model
    
    initialFetch: ->
        @fetch({data: {id: @vars['id']}})

return singleEmail

`})`
