
using db from '../db/Schema';

service MyService {

  

     @odata.draft.enabled
    entity Patients as projection on db.Patients;
    //  entity Doctors as projection on db.Doctors;
    entity Visits as projection on db.Visitor;
    function Total(PatientID : Integer) returns Integer;
}

