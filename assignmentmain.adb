with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO;use Ada.Integer_Text_IO;
with MatrixMult;use MatrixMult;
------------------------------------------------------------------------------
-------------------------------procedure--------------------------------------
procedure AssignmentMain is
---------------------------task reader ----------------------------
task type Reader is--Reader type
 entry Read_Matrix(In_Matrix:out Matrix);
end Reader;
task body Reader is--Reader body 
  Item:Integer;
begin
  accept Read_Matrix(In_Matrix:out Matrix) do
    for i in 1..SIZE loop
      for j in 1..SIZE loop
        Ada.Integer_Text_IO.get(Item);
        In_Matrix(i,j) := Item; 
      end loop;
    end loop;
  end Read_Matrix;
end Reader;
---------------------------task printers ----------------------------
task type Printers is--Printers type 
  entry Print_Matrix(Out_Matrix:Matrix);
end Printers;
task body Printers is----Printers body 
begin
  accept Print_Matrix(Out_Matrix:Matrix) do
     for i in 1..SIZE loop
      for j in 1..SIZE loop
        Put(Out_Matrix(i,j));
        Put(" ");
      end loop;
      New_Line;
    end loop;
  end Print_Matrix;
end Printers;
---------------------------pocedure main body--------------------------
A,B,C:Matrix;
Reader1:Reader;
Reader2:Reader;
New_Printer1:Printers;
New_Printer2:Printers;
Printer:Printers;
begin
  Reader1.Read_Matrix(A);
  Reader2.Read_Matrix(B);
  MatMult(A,B,C);
  Put("Matrix A is: ");
  New_Line;
  New_Printer1.Print_Matrix(A);
  Put("Matrix B is: ");
  New_Line;
  New_Printer2.Print_Matrix(B);  
  Put("Matrix C is: ");
  New_Line;
  Printer.Print_Matrix(C);
  Put("****************************finished***************************** ");
end AssignmentMain;
