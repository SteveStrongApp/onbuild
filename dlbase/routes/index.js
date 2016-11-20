var express = require('express');
module.exports = function(app) {
  var path = require('path');
  var fs = require('fs');
  var router = express.Router();


  function statPath(path) {
    try {
      return fs.statSync(path);
    } catch (ex) {}
    return false;
  }


  /* GET home page. */
  router.get('/', function(req, res, next) {

    var viewPath = path.join(__dirname, 'views');
    viewPath = app.get('views');
    var viewPathExist = statPath(viewPath);

    var dataPath = app.get('dataPath');
    var dataPathExist = statPath(dataPath);

    res.render('index', { 
      title: 'inside dlbase',
      view: viewPathExist ? 'view path exist': 'NO view path',
      data: dataPathExist ? 'data path exist': 'NO data path' 
    });
  });
  return router;
}

