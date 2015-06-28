// Use Parse.Cloud.define to define as many cloud functions as you want.
// For example:
// Parse.Cloud.define("hello", function(request, response) {
//   response.success("Hello world!");
// });

Parse.initialize("rqx952GFL9NF8RlTqPzCazKANGmvnNEPcskzJpPM", "y0lri40GdFPFYugI0EoQByLDrXLhLrkIJA5Zgwun");
// console.log("stuff");

Parse.Cloud.beforeSave("stuff", function(request, response) {
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
