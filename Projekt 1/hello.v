module arith_unit(
    input wire en, //DONE
    input wire rstn, //DONE
    input wire [7:0] load_value,//DONE
    input wire load, //DONE

    input wire clk, //DONE
    input wire dir, //DONE


    output reg [7:0] count, //DONE
    output reg terminal, //DONE
);
    always @(*) begin
        case (rstn)
            1'b1: count=1'b0;
            1'b0:
                begin 
                    case(en)
                        1'b1:
                        begin 
                            case(load)
                                1'b1:count = load_value;
                            endcase
                            
                            case(dir)
                                1'b0:always @(posedge clk)
                                begin
                                count=count+1;
                                end
                                
                                1'b1:always @(negedge clk)
                                begin
                                count=count+1
                                end
                            endcase
                        end
                    endcase

                    case(count)
                    1'd255: terminal=1'b1;
                    1'd0: terminal=1'b1;
                    default: terminal=1'b0;
                    endcase
                end
        endcase

                end


endmodule