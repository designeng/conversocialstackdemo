define([
    'wire',
],
function(wire){

    wire({}).then(
        function(context) {
            describe("BBrouter plugin", function() {
                it("just a test", function() {
                    expect(1).toEqual(1);
                });
            });
        })
});