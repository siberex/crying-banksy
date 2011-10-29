/**
 * @fileoverview This is Index controller.
 * Here will be album list with covers.
 *
 */

var {app} = require("../main");
export("index");


function index(request) {
  var context = {title: "It's working!"};
  //throw('Error! Oh noes, its error!');
  return app.render("index.html", context);
} // index