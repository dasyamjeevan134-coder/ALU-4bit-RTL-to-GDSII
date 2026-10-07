module alu_4bit (A,
    ALU_Sel,
    B,
    Y);
 input [3:0] A;
 input [1:0] ALU_Sel;
 input [3:0] B;
 output [3:0] Y;

 wire _00_;
 wire _01_;
 wire _02_;
 wire _03_;
 wire _04_;
 wire _05_;
 wire _06_;
 wire _07_;
 wire _08_;
 wire _09_;
 wire _10_;
 wire _11_;
 wire _12_;
 wire _13_;
 wire _14_;
 wire _15_;
 wire _16_;
 wire _17_;
 wire _18_;
 wire _19_;
 wire _20_;
 wire _21_;
 wire _22_;
 wire _23_;
 wire _24_;
 wire _25_;
 wire _26_;
 wire _27_;
 wire _28_;
 wire _29_;
 wire net1;
 wire net2;
 wire net3;
 wire net4;
 wire net5;
 wire net6;
 wire net7;
 wire net8;
 wire net9;
 wire net10;
 wire net11;
 wire net12;
 wire net13;
 wire net14;

 sky130_fd_sc_hd__inv_2 _30_ (.A(net2),
    .Y(_00_));
 sky130_fd_sc_hd__a211o_1 _31_ (.A1(net3),
    .A2(net7),
    .B1(_00_),
    .C1(net1),
    .X(_01_));
 sky130_fd_sc_hd__nand3_1 _32_ (.A(net3),
    .B(net7),
    .C(_00_),
    .Y(_02_));
 sky130_fd_sc_hd__o211a_1 _33_ (.A1(net3),
    .A2(net7),
    .B1(_01_),
    .C1(_02_),
    .X(net11));
 sky130_fd_sc_hd__or2b_1 _34_ (.A(net2),
    .B_N(net1),
    .X(_03_));
 sky130_fd_sc_hd__nand3_1 _35_ (.A(net7),
    .B(net8),
    .C(_03_),
    .Y(_04_));
 sky130_fd_sc_hd__a21o_1 _36_ (.A1(net7),
    .A2(_03_),
    .B1(net8),
    .X(_05_));
 sky130_fd_sc_hd__inv_2 _37_ (.A(net4),
    .Y(_06_));
 sky130_fd_sc_hd__a21o_1 _38_ (.A1(_04_),
    .A2(_05_),
    .B1(_06_),
    .X(_07_));
 sky130_fd_sc_hd__nand3_1 _39_ (.A(_06_),
    .B(_04_),
    .C(_05_),
    .Y(_08_));
 sky130_fd_sc_hd__or2b_1 _40_ (.A(net3),
    .B_N(net7),
    .X(_09_));
 sky130_fd_sc_hd__a21oi_1 _41_ (.A1(_07_),
    .A2(_08_),
    .B1(_09_),
    .Y(_10_));
 sky130_fd_sc_hd__and3_1 _42_ (.A(_07_),
    .B(_08_),
    .C(_09_),
    .X(_11_));
 sky130_fd_sc_hd__a21o_1 _43_ (.A1(net1),
    .A2(net4),
    .B1(net8),
    .X(_12_));
 sky130_fd_sc_hd__o211ai_1 _44_ (.A1(net1),
    .A2(net4),
    .B1(_12_),
    .C1(net2),
    .Y(_13_));
 sky130_fd_sc_hd__o31ai_1 _45_ (.A1(net2),
    .A2(_10_),
    .A3(_11_),
    .B1(_13_),
    .Y(net12));
 sky130_fd_sc_hd__a21bo_1 _46_ (.A1(_08_),
    .A2(_09_),
    .B1_N(_07_),
    .X(_14_));
 sky130_fd_sc_hd__o21a_1 _47_ (.A1(net7),
    .A2(net8),
    .B1(_03_),
    .X(_15_));
 sky130_fd_sc_hd__xnor2_1 _48_ (.A(net9),
    .B(_15_),
    .Y(_16_));
 sky130_fd_sc_hd__xor2_1 _49_ (.A(net5),
    .B(_16_),
    .X(_17_));
 sky130_fd_sc_hd__or2_1 _50_ (.A(_14_),
    .B(_17_),
    .X(_18_));
 sky130_fd_sc_hd__nand2_1 _51_ (.A(_14_),
    .B(_17_),
    .Y(_19_));
 sky130_fd_sc_hd__a21o_1 _52_ (.A1(net1),
    .A2(net5),
    .B1(net9),
    .X(_20_));
 sky130_fd_sc_hd__o211a_1 _53_ (.A1(net1),
    .A2(net5),
    .B1(_20_),
    .C1(net2),
    .X(_21_));
 sky130_fd_sc_hd__a31o_1 _54_ (.A1(_00_),
    .A2(_18_),
    .A3(_19_),
    .B1(_21_),
    .X(net13));
 sky130_fd_sc_hd__and2_1 _55_ (.A(net5),
    .B(_16_),
    .X(_22_));
 sky130_fd_sc_hd__a21oi_1 _56_ (.A1(_14_),
    .A2(_17_),
    .B1(_22_),
    .Y(_23_));
 sky130_fd_sc_hd__o21a_1 _57_ (.A1(net9),
    .A2(_15_),
    .B1(_03_),
    .X(_24_));
 sky130_fd_sc_hd__xor2_1 _58_ (.A(net10),
    .B(net6),
    .X(_25_));
 sky130_fd_sc_hd__xnor2_1 _59_ (.A(_24_),
    .B(_25_),
    .Y(_26_));
 sky130_fd_sc_hd__xnor2_1 _60_ (.A(_23_),
    .B(_26_),
    .Y(_27_));
 sky130_fd_sc_hd__a21o_1 _61_ (.A1(net10),
    .A2(net6),
    .B1(net1),
    .X(_28_));
 sky130_fd_sc_hd__o211a_1 _62_ (.A1(net10),
    .A2(net6),
    .B1(_28_),
    .C1(net2),
    .X(_29_));
 sky130_fd_sc_hd__a21o_1 _63_ (.A1(_00_),
    .A2(_27_),
    .B1(_29_),
    .X(net14));
 sky130_fd_sc_hd__decap_3 PHY_0 ();
 sky130_fd_sc_hd__decap_3 PHY_1 ();
 sky130_fd_sc_hd__decap_3 PHY_2 ();
 sky130_fd_sc_hd__decap_3 PHY_3 ();
 sky130_fd_sc_hd__decap_3 PHY_4 ();
 sky130_fd_sc_hd__decap_3 PHY_5 ();
 sky130_fd_sc_hd__decap_3 PHY_6 ();
 sky130_fd_sc_hd__decap_3 PHY_7 ();
 sky130_fd_sc_hd__decap_3 PHY_8 ();
 sky130_fd_sc_hd__decap_3 PHY_9 ();
 sky130_fd_sc_hd__decap_3 PHY_10 ();
 sky130_fd_sc_hd__decap_3 PHY_11 ();
 sky130_fd_sc_hd__decap_3 PHY_12 ();
 sky130_fd_sc_hd__decap_3 PHY_13 ();
 sky130_fd_sc_hd__decap_3 PHY_14 ();
 sky130_fd_sc_hd__decap_3 PHY_15 ();
 sky130_fd_sc_hd__decap_3 PHY_16 ();
 sky130_fd_sc_hd__decap_3 PHY_17 ();
 sky130_fd_sc_hd__decap_3 PHY_18 ();
 sky130_fd_sc_hd__decap_3 PHY_19 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_20 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_21 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_22 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_23 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_24 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_25 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_26 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_27 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_28 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_29 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_30 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_31 ();
 sky130_fd_sc_hd__clkbuf_2 input1 (.A(ALU_Sel[0]),
    .X(net1));
 sky130_fd_sc_hd__clkbuf_2 input2 (.A(ALU_Sel[1]),
    .X(net2));
 sky130_fd_sc_hd__buf_1 input3 (.A(A[0]),
    .X(net3));
 sky130_fd_sc_hd__buf_1 input4 (.A(A[1]),
    .X(net4));
 sky130_fd_sc_hd__buf_1 input5 (.A(A[2]),
    .X(net5));
 sky130_fd_sc_hd__buf_1 input6 (.A(A[3]),
    .X(net6));
 sky130_fd_sc_hd__clkbuf_2 input7 (.A(B[0]),
    .X(net7));
 sky130_fd_sc_hd__buf_1 input8 (.A(B[1]),
    .X(net8));
 sky130_fd_sc_hd__buf_1 input9 (.A(B[2]),
    .X(net9));
 sky130_fd_sc_hd__buf_1 input10 (.A(B[3]),
    .X(net10));
 sky130_fd_sc_hd__buf_2 output11 (.A(net11),
    .X(Y[0]));
 sky130_fd_sc_hd__buf_2 output12 (.A(net12),
    .X(Y[1]));
 sky130_fd_sc_hd__buf_2 output13 (.A(net13),
    .X(Y[2]));
 sky130_fd_sc_hd__buf_2 output14 (.A(net14),
    .X(Y[3]));
endmodule
