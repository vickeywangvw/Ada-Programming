package MatrixMult is
  --type subsize is range 1..10;
  SIZE:Integer:=10;
  type Matrix is array(1..SIZE,1..SIZE) of Integer;
  procedure MatMult(A:in Matrix;B:in Matrix;C:out Matrix);
end MatrixMult;
