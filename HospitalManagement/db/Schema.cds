namespace db;
entity Visitor{
    key VisitorID : String;
    // key DoctorID : Integer;
    key PatientID : String;
    VisitsDate : Date;
    Total : Integer;
    // visitsTodoctor : Association to one Doctors on visitsTodoctor.DoctorID = DoctorID;
    visitsTopatients : Association to one Patients on visitsTopatients.PatientID = PatientID;
}


entity Patients{
    // @Core.Computed:True
    key PatientID : String ;//@readonly;
    PatientName : String;
    PatientAge : Integer;
    PatientPhone : String @assert.format: '^[0-9]{10}$';
    PatientCity : String;
    Status:String;
    statusCriticality : Integer;
    patientsTovisits : Composition of many Visitor on patientsTovisits.visitsTopatients = $self;
}



// entity Doctors {
//     key DoctorID : Integer;
//     DoctorName : String;


    
//     specialization : String;
//     DoctorPhone : String;
//     doctorTovisits:Composition of many Visitor on doctorTovisits.visitsTodoctor=$self;
// }