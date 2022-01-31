// codeunit 51101 "Mobile Images"
// {


//     trigger OnRun()

//     var
//         MobileRec: Record "Mobile List";
//         FileName: Text;
//         ImageID: Guid;
//         ConfirmedMsh: Label 'An Image With The Following ID has beeb Imported On Mobile List %1:%2';
//     begin

//         if MobileRec.FindFirst() then begin
//             repeat begin
//                 FileName := 'C:\Images\' + Format(MobileRec."Mobile ID") + '.jpg';

//                 if File.Exists(FileName) then begin
//                     ImageID := MobileRec."Mobile Image".ImportFile(FileName, 'Mobile Images' + Format(MobileRec."Mobile ID"));
//                     MobileRec.Modify();
//                     Message(ConfirmedMsh, MobileRec."Mobile ID", ImageID);

//                 end;

//             end;
//             until MobileRec.Next() < 1;


//         end;


//     end;



//     var
//         myInt: Integer;
// }