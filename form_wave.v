module form_wave (

input wire CLK,
input wire RESET,

input wire DDS,               
output reg[31:0] DDSout, 
input wire [2:0] form
);

always@(posedge CLK or posedge RESET)

// saw
case(form)
3'b000:                    
 begin
 DDSout <= DDS;
 end

//reverse saw
3'b001:                   
 begin
  if(RESET)
   DDSout <= -DDS;
 end

//triangle
3'b010:                  
begin
if (DDS == 8'b01111111)
  begin
  DDSout <= DDS;
  end
else 
  begin
   DDSout <= -DDS; 
  end
end

//meander
3'b011:                      
 begin
  if (DDS == 8'b00111111)
        DDSout <= 8'b00000001;
      else
        DDSout <= 8'b00000000;
  end

//meander025
3'b100:                           
begin
  if(DDS == 8'b00100000)
   DDSout <= 1;
    else
   DDSout <= 0;
end

endcase   
endmodule
