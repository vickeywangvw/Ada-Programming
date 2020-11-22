with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO;use Ada.Integer_Text_IO;
---------------------------------------------------------------------
-------------------------------package ------------------------------
package body MatrixMult is
------------------------procedure -------------------------
procedure MatMult(A:in Matrix;B:in Matrix;C:out Matrix) is 
------------------------task Mult -------------------------
task type Mult is --Mult Type
  entry Multiply(Index_Col:Integer;Index_Row:Integer);
end Mult;
task body Mult is --Mult body
  col,row:Integer;
  Matrix_Element:Integer:=0;
begin
  accept Multiply(Index_Col:Integer;Index_Row:Integer) do
    row := Index_Row;
    col := Index_Col;
  for i in 1..SIZE loop
    Matrix_Element:= Matrix_Element +A(row,i)*B(i,col);
  end loop;
  C(row,col):=Matrix_Element;
  end Multiply;
end Mult;
-----------------------  MultTask ----------------------------
  MultTask: array(1..SIZE*SIZE) of Mult;
begin
  for m in 1..SIZE loop
    for n in 1..SIZE loop
      MultTask((m-1)*SIZE+n).Multiply(m,n);
    end loop;
  end loop;
end MatMult;
end MatrixMult;
  
