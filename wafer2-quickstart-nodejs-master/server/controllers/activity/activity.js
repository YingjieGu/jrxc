
// 活动信息查询接口
const db = require('../../tools/db.js')

async function get(ctx, next) {
  console.log('开始查询活动信息')
  var sql_queryActivity = 'select * from activity as a, session as s where a.id = ? and a.id = s.activity_id';
  var param_queryActivity = [1];
  var res = await db.query(sql_queryActivity, param_queryActivity)
  ctx.state.data = res
}

async function post(req, res) {
  console.log('开始更新活动信息')
  var sql_queryActivity = 'select * from activity as a, session as s where a.id = ? and a.id = s.activity_id';
  var param_queryActivity = [1];
  var res = await db.query(sql_queryActivity, param_queryActivity)
  ctx.state.data = res
}

module.exports = {
  get
}
