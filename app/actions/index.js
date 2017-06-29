/**
 * @fileoverview This is Index controller.
 * Here will be album list with covers.
 *
 */

var {app} = require('../main');
export('index', 'alexa');


function index(request) {
    var context = {title: "Stephen Jingel, advertising photographer"};
    //throw('Error! Oh noes, its error!');
    return app.render("index.html", context);
} // index


function alexa(request) {
    var context = {title: "Alexa stats for microstocks"};
    return app.render("alexa.html", context);
//} // alexa