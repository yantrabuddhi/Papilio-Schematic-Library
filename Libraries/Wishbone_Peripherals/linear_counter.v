//////////////////////////////////////////////////////////////////////////////////
// University of Toronto
// NES APU UNIT
// Engineer: Bill Dai
// Create Date: 03/21/2008 
// Design Name: NES APU UNIT
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////
// Linear Counter
//////////////////////////////////////////////////////////////////////////////////

module linear_counter(
                      iClk,
							 iReset,
							 iEnable,
							 iControl_flag,
							 iDuration,
							 oData
							 );
							 
  //-------------------------------------------------------------------------------------------------------
  //  PORTS
  //-------------------------------------------------------------------------------------------------------

  input iClk;
  input iReset;
  input iEnable;
  input iControl_flag;
  input [6:0] iDuration;
  output oData;
  
  //-------------------------------------------------------------------------------------------------------
  //  HALT FLAG
  //-------------------------------------------------------------------------------------------------------
    
  reg halt_flag;
	 
 /* always @(posedge iClk or posedge iReset)
  begin
	 if (iReset == 1)
	   halt_flag <= 1;
	 //else
     // if (!iControl_flag) halt_flag <= 0;
  end
*/  
  //-------------------------------------------------------------------------------------------------------
  //  COUNTER
  //-------------------------------------------------------------------------------------------------------
 
  reg [6:0] counter;
 
  always @(posedge iClk or posedge iReset)
  begin
    if (iReset) halt_flag <= 1;
	 else if (iEnable == 1) begin
	     	 if (halt_flag) begin
			  counter <= iDuration;
			  if (!iControl_flag) halt_flag <= 0; 
		    end else if (counter > 0) counter <= counter - 1;
		   end
  end
  
  //-------------------------------------------------------------------------------------------------------
  //  OUTPUT
  //-------------------------------------------------------------------------------------------------------
  
  assign oData = (counter > 0) ? 1:0;
  
endmodule