`define([
    'backbone'
],
function(Backbone){`

class EmailCollection extends Backbone.Collection
    url: '/json/allmail.json'

return EmailCollection

`})`
