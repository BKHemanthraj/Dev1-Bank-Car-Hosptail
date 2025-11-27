// namespace db;
// entity Car_Company {
//     key CompanyID:UUID;         
//     CompanyName:String(50);
//     FoundedDate:Date;
//     car:String;
//     HeadOffice:String(100);
//     CompanyEmail:String(50);
//     EmployeeCount:Int32;
//     Revenue:Decimal(15,2);   
//     IsActive:Boolean;
// }


using { cuid } from '@sap/cds/common';

namespace db;

// TABLE
entity Books : cuid {
    title : String(200);   // FIELD
    author: String(100);   // FIELD
    price : Decimal(9,2);  // FIELD
}
