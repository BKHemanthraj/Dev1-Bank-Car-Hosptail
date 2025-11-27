const cds = require('@sap/cds')
// module.exports=cds.service.impl(function(srv){
//     srv.on('greet',async(req)=>{
//         const {name}=req.data
//         console.log(req.data)
//         return name
//     });
//         srv.on('Wish',async(req)=>{
//         const {name}=req.data
//         console.log(req.data)
//         return name
//     });
//     // srv/service.js

// // srv/service.js
// const cds = require('@sap/cds');

// module.exports = cds.service.impl(function () {

//   this.on('Total', async (req) => {
//     const { CusId } = req.data;

//     const { Orders } = this.entities('db');

//     const row = await cds.run(
//       SELECT.one.from(Orders).columns('sum(TotalAmount) as total').where({ CusId })
//     );

//     const total = row && row.total ? row.total : 0;

//     // 🔥 Show alert message to the user
//     req.info(`Total Order Amount = ${total}`);

//     return total;
//   });

// });

// const cds = require('@sap/cds');

module.exports = cds.service.impl(function () {

  // this.on('Total', async (req) => {

  //   console.log("Server: Total action called with", req.data);
  //   const { CusId } = req.data;
  //   if (!CusId) {
  //     req.error("CusId required");
  //     return 0;
  //   }
  //   const { Orders } = this.entities('db');
  //   const row = await cds.run(
  //     SELECT.one.from(Orders).columns('sum(TotalAmount) as total').where({ CusId })
  //   );
  //   const total = row && row.total ? parseFloat(row.total) : 0;
  //   console.log("Server: computed total = ", total);
  //   return total;
  // });

  this.on('Total', async function (req) {   //Total is the function name we writen in the servics.cds
debugger
    console.log("req", req)
    var custid = req.data.CusId;
    console.log("custid", custid);
    let orders = await SELECT('Orders').where({ CusId: custid });   //Orders is the schema.cds we writen in the file
    console.log('Orders', orders)
    var sum=0
    for (let order of orders) {
    var b = order.TotalAmount

              sum += Number(b)
          }
          console.log("Totalammount"+sum)

          // 5. Show result
          return{TotalAmount : sum};
  })

});


//   module.exports = async function () {
//     this.on ('Total', async function (req) {
//         debugger;
//         console.log("req", req)
//         var custid = req.data.CusId;
//         console.log("CusId", CusId);
//         let orders = await SELECT ('Order') .where ({CusId : CusId});
//         console.log('orders', orders)
//     })
// }

