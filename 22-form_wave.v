module form_wave (

input wire CLK,
input wire RESET,
                                       
input wire [31:0] ADDER,                
output reg [31:0] DDS, 
input wire [2:0] form
);

always@(posedge CLK or posedge RESET)

// saw
case(form)
3'b000:                    
 begin
 DDS <= DDS;
 end

//reverse saw
3'b001:                   
 begin
  if(RESET)
   DDS <= -DDS;
 end

//triangle
3'b010:                  
begin
if (DDS == 8'b01111111) //50гц пополам
  begin
  DDS <= DDS;
  end
else 
  begin
   DDS <= -DDS; 
  end
end

//meander
3'b011:                      
 begin
  if (DDS == 8'b00111111)
        DDS <= 8'b00000001;
      else
        DDS <= 8'b00000000;
  end

//meander025
3'b100:                           
begin
  if(DDS == 8'b00100000)
   DDS <= 1;
    else
   DDS <= 0;
end

endcase   
endmodule
