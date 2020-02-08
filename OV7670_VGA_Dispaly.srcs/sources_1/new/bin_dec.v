`timescale 1ns / 1ps

module bin_dec(clk,bin,rst_n,one,ten,hun,count,shift_reg
    );
input  [7:0] bin;
input        clk,rst_n;
output [3:0] one,ten;
output [3:0] count;
output [1:0] hun;
output [17:0]shift_reg;
reg    [3:0] one,ten;
reg    [1:0] hun;
reg    [3:0] count;
reg    [17:0]shift_reg=18'b000000000000000000;
//-------------------------------------------------------
//counter
always @ ( posedge clk or negedge rst_n )
begin
 if( !rst_n )
   count<=0;
 else if (count==9)
   count<=0;
 else
   count<=count+1;
end


//-------------------------------------------------------
//binary to decimal
always @ (posedge clk or negedge rst_n )
begin
  if (!rst_n)
       shift_reg=0;
  else if (count==0)
       shift_reg={10'b0000000000,bin};
  else if ( count<=8)                //8 shifting
   begin
      if(shift_reg[11:8]>=5)         //if tens > 5, +3 
          begin
             if(shift_reg[15:12]>=5) //if ones > 5, +3
                 begin
   shift_reg[15:12]=shift_reg[15:12]+2'b11;   
   shift_reg[11:8]=shift_reg[11:8]+2'b11;
shift_reg=shift_reg<<1;  //left shift
 end
             else
       begin
                   shift_reg[15:12]=shift_reg[15:12];
shift_reg[11:8]=shift_reg[11:8]+2'b11;
shift_reg=shift_reg<<1;
 end
          end              
      else
          begin
             if(shift_reg[15:12]>=5)
                 begin
   shift_reg[15:12]=shift_reg[15:12]+2'b11;
   shift_reg[11:8]=shift_reg[11:8];
shift_reg=shift_reg<<1;
 end
             else
       begin
                   shift_reg[15:12]=shift_reg[15:12];
shift_reg[11:8]=shift_reg[11:8];
shift_reg=shift_reg<<1;
 end
          end        
  end
  end

//-----------------------------------------------------
//output
always @ ( posedge clk or negedge rst_n )
begin
 if ( !rst_n )
  begin
    one<=0;
    ten<=0;
    hun<=0; 
  end
 else if (count==9)  //shift finished
  begin
    one<=shift_reg[11:8];
ten<=shift_reg[15:12];
hun<=shift_reg[17:16]; 
  end
end
endmodule