// pageextension 51101 RoleCenterExt extends "Business Manager Role Center"
// {

//     actions
//     {

//         addlast(sections)
//         {

//             group("Mobile Brand")
//             {

//                 Caption = 'Mobile Brand';

//                 ToolTip = 'View Mobile Brand Extension';

//                 action("Mobile Brand Page")
//                 {
//                     Caption = 'Mobile Brand';
//                     ApplicationArea = All;
//                     RunObject = page "Mobile Brand";
//                     Promoted = true;
//                     PromotedCategory = Process;
//                     ToolTip = 'View Mobile Brand';
//                 }
//                 action("Mobile List")
//                 {
//                     Caption = 'Mobile List';
//                     ApplicationArea = All;
//                     RunObject = page "Mobile List";
//                     Promoted = true;
//                     PromotedCategory = Process;
//                     ToolTip = 'View The List Of Mobiles';
//                 }
//                 action("Mobile Sale List")
//                 {
//                     Caption = 'Mobile Sale List';
//                     ApplicationArea = All;
//                     RunObject = page "Mobile Sale List";
//                     Promoted = true;
//                     PromotedCategory = Process;
//                     ToolTip = 'View Mobile Sales';
//                 }
//                 action("Mobile Purchase List")
//                 {
//                     Caption = 'Mobile Purchase List';
//                     ApplicationArea = All;
//                     RunObject = page "Mobile Purchase List";
//                     Promoted = true;
//                     PromotedCategory = Process;
//                     ToolTip = 'View Mobile Purchases';
//                 }
//             }


//         }
//     }

//     var
//         myInt: Integer;
// }