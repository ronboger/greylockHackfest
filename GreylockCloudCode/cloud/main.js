// Use Parse.Cloud.define to define as many cloud functions as you want.
// For example:
// Parse.Cloud.define("hello", function(request, response) {
//   response.success("Hello world!");
// });

Parse.initialize("rqx952GFL9NF8RlTqPzCazKANGmvnNEPcskzJpPM", "y0lri40GdFPFYugI0EoQByLDrXLhLrkIJA5Zgwun");
// console.log("stuff");

Parse.Cloud.define("createGameScores", function(request, response) {
    var GameScore = Parse.Object.extend("GameScore");
    var gameScore = new GameScore();

    gameScore.set("score", 1337);
    gameScore.set("playerName", "Sean Plott");
    gameScore.set("cheatMode", false);

    gameScore.save(null, {
        success: function(gameScore) {
            // Execute any logic that should take place after the object is saved.
            alert('New object created with objectId: ' + gameScore.id);
        },
        error: function(gameScore, error) {
            // Execute any logic that should take place if the save fails.
            // error is a Parse.Error with an error code and message.
            alert('Failed to create new object, with error code: ' + error.message);
        }
    });
});


Parse.Cloud.define('httpRequest', function(request, response) {
        Parse.Cloud.httpRequest({
            url: 'http://www.parse.com/',
            success: function(httpResponse) {
                console.log(httpResponse.text);
            },
            error: function(httpResponse) {
                console.error('Request failed with response code ' + httpResponse.status);
            }
        });
});
//require("cloud/linkedin_api.js")
//require("cloud/facebook_api.js")


Parse.Cloud.define("tourCreated", function(request, response) {

    var Tour = Parse.Object.extend("Tour");
    var tour = new Tour();
    tour.save(null, {
        success: function(listing) {
            response.success();
            console.log("Save ok");
        },
        error: function(error) {
            response.error(error);
            console.log("Save ko");
        }
    });
});

Parse.Cloud.define("profileCreated", function(request, response) {

    var Profile = Parse.Object.extend("Profile");
    var profile = new Profile();

    profile.set("name", "Bryan Keller");
    profile.set("profilePictureFile", "https://media.licdn.com/media/p/1/005/04d/21b/2dc5482.jpg");
    profile.set("headline", "ay lmaoing since 1995");
    profile.save(null, {
        success: function(profile) {
            response.success();
            console.log("Save ok");
        },
        error: function(error) {
            response.error(error);
            console.log("bryan can't save properly :(");
        }
    });
});
