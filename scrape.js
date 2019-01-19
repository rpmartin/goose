// scrape.js

var webPage = require('webpage');
var page = webPage.create();

var fs = require('fs');
var path = 'scraped.html'

page.open('https://www.theweathernetwork.com/ca/monthly/british-columbia/victoria?year=2019&month=1&dispt=calendar-container-monthly', function (status) {
  var content = page.content;
  fs.write(path,content,'w')
  phantom.exit();
});
