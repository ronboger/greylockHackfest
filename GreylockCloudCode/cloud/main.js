
// Use Parse.Cloud.define to define as many cloud functions as you want.
// For example:
//require("cloud/linkedin_api.js")
//require("cloud/facebook_api.js")

/*Parse.Cloud.define("hello", function(request, response) {
  response.success("Hello world!");
});*/

Parse.Cloud.define("tourCreated", function(request, response) {

    var Tour = Parse.Object.extend("Tour");
    var tour = new Tour();
    tour.save(null, {
    success: function (listing) {
        response.success();
        console.log("Save ok");
    },
    error: function (error) {
        response.error(error);
        console.log("Save ko");
    }
	});

});
