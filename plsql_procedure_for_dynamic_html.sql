--https://o7planning.org/en/10447/create-dynamic-content-region-in-oracle-apex

Declare
   Cursor c_Dept Is
      Select Deptno
            ,Dname
            ,Loc
      From   Dept;
   --
   Cursor c_Emp(p_Deptno Number) Is
      Select Empno
            ,Ename
            ,Job
      From   Emp
      Where  Emp.Deptno = p_Deptno;
Begin
   Htp.p('<div class="mytree-container">');
   --
   For Rec_d In c_Dept Loop
      Htp.p('<ul>');
      Htp.p('<h4>' || Rec_d.Dname || '</h4>');
      --
      For Rec_e In c_Emp(Rec_d.Deptno) Loop
         Htp.p('<li>' || Rec_e.Ename || '</li>');
      End Loop;
      --
      Htp.p('</ul>');
   End Loop;
   --
   Htp.p('</div>');
End;
