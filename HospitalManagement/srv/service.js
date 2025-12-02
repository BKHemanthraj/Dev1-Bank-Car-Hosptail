const cds = require('@sap/cds')
module.exports = cds.service.impl( function () {
        const { Visitor } =this.entities;
        const { Patients } =this.entities;
        this.on('Total', async function (req) {   //Total is the function name we writen in the servics.cds
        debugger
        console.log("req", req)
        var {PatientID} = req.data;
        console.log("PatientID", PatientID);
        let orders = await SELECT('Visitor').where({ PatientID: PatientID });   //Orders is the schema.cds we writen in the file
        console.log('Visitor', orders)

        var sum=0
        for (let order of orders) {
        var b = order.Total
        sum += b
        }

        console.log("Totalammount"+sum)
                return{Total : sum};
                })
debugger
        const genID = () => "PEOL" + (Math.floor(Math.random() * 100) + 1);

        // Draft create
        this.before("CREATE", Patients.drafts, req => {
          if (!req.data.PatientID) {
            req.data.PatientID = genID();
          }
        });

        // Active create
        // this.before("CREATE", Patients, req => {
        //   debugger;
        //   // if (!req.data.PatientName) {
        //   //   req.error(400, "Name required");
        //   // }
        //   // if (req.data.PatientName.length > 4) {
        //   //   req.error(400, "Name length must be <= 4");
        //   // }
        //   req.data.PatientName = "Hemanth";
        // });
        // this.on("CREATE", Patients, req => {
        //   debugger;
        // });

        
});



    //    this.before('CREATE', 'Patients', req => {
    //     debugger;
 
    //     if (!req.data.PatientName) {
    //         req.error(400, "Name is required");
    //     }
 
    //     })
    //     this.on('CREATE', 'Patients' , (req,next) =>{
    //         debugger;
    //         return next()
    
    //     } )



    //     this.after('CREATE', 'Patients' , (req)=>{
    //         debugger;
    //     } )
