unit CREATE_EDIT_Supplier;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls ,System.Generics.Collections, Main_Class, Supplier, Supplier_class,
  Vcl.ExtDlgs , StrUtils , JPEG, Vcl.ExtCtrls;

type
  TForm13 = class(TForm)
    Label1: TLabel;
    Edit_name: TEdit;
    Label2: TLabel;
    Label4: TLabel;
    Edit_tel: TEdit;
    Label7: TLabel;
    Edit_email: TEdit;
    Label8: TLabel;
    Edit_Inn: TEdit;
    Label10: TLabel;
    ComboBox_type: TComboBox;
    Button1: TButton;
    Button2: TButton;
    Label3: TLabel;
    Edit_rate: TEdit;

    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    procedure SaveNewInArrayOfSup;
    procedure SaveInDB;

  public
       constructor Create( AOwner: TComponent);  override;
        procedure Init(sup:TSupplier);
        var   nothing_to_change, modeEdit,need_delete:boolean;
        var  sup_after_change:TSupplier;
  end;

var
  Form13: TForm13;
  new_sup: TSupplier;
  arr: array[0..7] of string;
  img:TJpegImage;
  mc:TMain_class;

  to_change,  img_name: string;
  ext:string;
  sup_on_change:TSupplier;


implementation

{$R *.dfm}
  procedure TForm13.Button1Click(Sender: TObject);      //save
begin


       if not (modeEdit ) then  //???? ????? ????????
       begin
         SaveNewInArrayOfSup;
         SaveInDB;
         Inc(TSupplier_Class.max_id);


       end
       else
       begin                    //???? ????? ??????????????

           SaveInDB;

           sup_after_change.ID:= sup_on_change.ID;
           sup_after_change.Title:=  sup_on_change.Title;
           sup_after_change.Rate:=  sup_on_change.Rate;
           sup_after_change.INN:=  sup_on_change.INN;
           sup_after_change.Type_:=    sup_on_change.Type_;
           sup_after_change.Tel:=     sup_on_change.Tel;
           sup_after_change.Email:= sup_on_change.Email;




       end;
       ShowMessage('?????????');
        Close;


end;



procedure TForm13.Button2Click(Sender: TObject);
begin
      if (modeEdit = True) then
               begin
                 need_delete:=true;
                 mc.sql_delete( 'Supplier' , ' Id '  ,sup_on_change.ID.ToString );
                 ShowMessage('???????');
                 Close;
               end

               else
               begin
                   Close;

               end;

end;

constructor TForm13.Create(AOwner: TComponent);
  begin

           mc:=TMain_class.Create;
           new_sup:= TSupplier.Create;

           inherited;

  end;
  procedure TForm13.SaveNewInArrayOfSup;
  begin
         new_sup.ID:=(TSupplier_Class.max_id +1) ;
         new_sup.Title:=Edit_name.Text;
         new_sup.Type_:=ComboBox_type.Text;
         new_sup.Tel  :=Edit_tel.Text;
         new_sup.Email:=Edit_email.Text;

         new_sup.Logo:= img_name;

         TSupplier_Class.array_of_suppliers.Add(new_sup);

  end;
    procedure TForm13.SaveInDB;
  begin

            if not (modeEdit ) then  //???? ????? ????????
       begin

          arr[0]:= (TSupplier_Class.max_id +1).ToString;
           arr[1]:= new_sup.Title;
           arr[2]:=new_sup.Type_;
            arr[3]:=new_sup.INN;
             arr[4]:=new_sup.Rate.ToString;
              arr[5]:=new_sup.Logo;
               arr[6]:=new_sup.Tel;
                arr[7]:=new_sup.Email;
            mc.sql_insert('Supplier', arr);


       end
       else
       begin                    //???? ????? ??????????????

              to_change:='';

              if NOT(sup_on_change.Title=(Edit_name.Text)) then
              begin
                  if (to_change='') then  to_change:= '  Title = '+#39 + Edit_name.Text + #39  else  to_change:=to_change+' , Title = '+#39 + Edit_name.Text + #39;
                  nothing_to_change:=false;
              end;

              if NOT(sup_on_change.Type_= (ComboBox_type.Text)) then
              begin
                   if (to_change='') then  to_change:= ' Type  = '+#39 + ComboBox_type.Text + #39  else  to_change:=to_change+' , Type = '+#39 + ComboBox_type.Text + #39;
                    nothing_to_change:=false;
              end;

              if NOT(sup_on_change.inn=Edit_inn.Text) then
              begin
                    if (to_change='') then  to_change:= ' inn = '+#39 + Edit_inn.Text + #39  else  to_change:=to_change+' , inn = '+#39 + Edit_inn.Text + #39;
                      nothing_to_change:=false;
              end;

              if NOT (IntToStr(sup_on_change.Rate)= ((Edit_rate.Text))) then
              begin
                      if (to_change='') then  to_change:= ' rate = '+#39 + Edit_rate.Text + #39  else  to_change:=to_change+' , rate = '+#39 + Edit_rate.Text + #39;
                       nothing_to_change:=false;
              end;

              if NOT(sup_on_change.Tel= (Edit_tel.Text)) then
              begin
                      if (to_change='') then  to_change:= ' Tel = '+#39 + Edit_tel.Text + #39  else  to_change:=to_change+' , Tel = '+#39 + Edit_tel.Text + #39;
                      nothing_to_change:=false;
              end;

                 if NOT(sup_on_change.Email= (Edit_email.Text)) then
              begin
                      if (to_change='') then  to_change:= ' email = '+#39 + Edit_email.Text + #39  else  to_change:=to_change+' , email = '+#39 + Edit_email.Text + #39;
                      nothing_to_change:=false;
              end;
                 if not nothing_to_change   then
                 mc.sql_update('supplier',to_change, ' where Id = ' +   sup_on_change.ID.ToString );


       end;



  end;



  procedure TForm13.Init(sup:TSupplier);
        begin
              sup_after_change:= TSupplier.Create;
              sup_on_change:=sup;
              Edit_name.Text:=sup.Title;
              Edit_tel.Text:=sup.Tel;
              Edit_email.Text:=sup.Email;
              Edit_inn.Text:=sup.INN;
              Edit_rate.Text:=sup.Rate.ToString;

              if sup.Type_='???' then
              ComboBox_type.ItemIndex:=0
              else
              if sup.Type_='???' then
              ComboBox_type.ItemIndex:=1
              else
              if sup.Type_='??' then
              ComboBox_type.ItemIndex:=2
              else
              if sup.Type_='??' then
              ComboBox_type.ItemIndex:=3;










               if (modeEdit = True) then
               begin
                Label1.Caption:= '????????????? ??????';
                Button2.Caption:='???????';
               end

               else
               begin
                   Label1.Caption:= '?????????? ?????? ??????????';
                    Button2.Caption:='????????';

               end;



        end;




end.
