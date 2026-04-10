module mux (input [3:0] X, input [3:0] Y, input select,output otsel,output [3:0] M);

assign M[0] = select ? Y[0] : X[0]; 
assign M[1] = select ? Y[1] : X[1];
assign M[2] = select ? Y[2] : X[2];
assign M[3] = select ? Y[3] : X[3];


endmodule