var mysql = require('mysql'); 
const config = require('../../config')

var connection = mysql.createConnection({
  host: config.host,
  port: config.port,
  user: config.user,
  password: config.pass,
  database: config.db,
  charset: config.char,
  multipleStatements: true
})

async function get(ctx, next){
  connection.connect();

  var activitySql = 'select * from activity where id = ?';

  var activitySql_Params = [1];

  connection.query(activitySql, activitySql_Params, function (err, result) {
    if (err) {
      console.log('[SELECT ERROR] - ', err.message);
      return;
    }
    console.log('-------SELECT----------');
    //console.log('INSERT ID:',result.insertId);       
    console.log(result);
    console.log('#######################');
    ctx.state.data = result
  });

  connection.end();
}

module.exports = {
  get
}