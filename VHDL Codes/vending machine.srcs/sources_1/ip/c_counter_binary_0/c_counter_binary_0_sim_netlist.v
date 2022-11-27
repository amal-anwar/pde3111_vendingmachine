// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Wed Oct 23 15:11:19 2019
// Host        : DESKTOP-JHRPMB6 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim {e:/vending machine extended/vending machine/vending
//               machine.srcs/sources_1/ip/c_counter_binary_0/c_counter_binary_0_sim_netlist.v}
// Design      : c_counter_binary_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "c_counter_binary_0,c_counter_binary_v12_0_12,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_counter_binary_v12_0_12,Vivado 2018.3" *) 
(* NotValidForBitStream *)
module c_counter_binary_0
   (CLK,
    Q);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF q_intf:thresh0_intf:l_intf:load_intf:up_intf:sinit_intf:sset_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 10000000, PHASE 0.000, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 q_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME q_intf, LAYERED_METADATA undef" *) output [15:0]Q;

  wire CLK;
  wire [15:0]Q;
  wire NLW_U0_THRESH0_UNCONNECTED;

  (* C_AINIT_VAL = "0" *) 
  (* C_CE_OVERRIDES_SYNC = "0" *) 
  (* C_FB_LATENCY = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_WIDTH = "16" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* c_count_by = "1" *) 
  (* c_count_mode = "0" *) 
  (* c_count_to = "1" *) 
  (* c_has_load = "0" *) 
  (* c_has_thresh0 = "0" *) 
  (* c_latency = "1" *) 
  (* c_load_low = "0" *) 
  (* c_restrict_count = "0" *) 
  (* c_thresh0_value = "1" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  c_counter_binary_0_c_counter_binary_v12_0_12 U0
       (.CE(1'b1),
        .CLK(CLK),
        .L({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .LOAD(1'b0),
        .Q(Q),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0),
        .THRESH0(NLW_U0_THRESH0_UNCONNECTED),
        .UP(1'b1));
endmodule

(* C_AINIT_VAL = "0" *) (* C_CE_OVERRIDES_SYNC = "0" *) (* C_COUNT_BY = "1" *) 
(* C_COUNT_MODE = "0" *) (* C_COUNT_TO = "1" *) (* C_FB_LATENCY = "0" *) 
(* C_HAS_CE = "0" *) (* C_HAS_LOAD = "0" *) (* C_HAS_SCLR = "0" *) 
(* C_HAS_SINIT = "0" *) (* C_HAS_SSET = "0" *) (* C_HAS_THRESH0 = "0" *) 
(* C_IMPLEMENTATION = "0" *) (* C_LATENCY = "1" *) (* C_LOAD_LOW = "0" *) 
(* C_RESTRICT_COUNT = "0" *) (* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) 
(* C_THRESH0_VALUE = "1" *) (* C_VERBOSITY = "0" *) (* C_WIDTH = "16" *) 
(* C_XDEVICEFAMILY = "artix7" *) (* ORIG_REF_NAME = "c_counter_binary_v12_0_12" *) (* downgradeipidentifiedwarnings = "yes" *) 
module c_counter_binary_0_c_counter_binary_v12_0_12
   (CLK,
    CE,
    SCLR,
    SSET,
    SINIT,
    UP,
    LOAD,
    L,
    THRESH0,
    Q);
  input CLK;
  input CE;
  input SCLR;
  input SSET;
  input SINIT;
  input UP;
  input LOAD;
  input [15:0]L;
  output THRESH0;
  output [15:0]Q;

  wire \<const1> ;
  wire CLK;
  wire [15:0]Q;
  wire NLW_i_synth_THRESH0_UNCONNECTED;

  assign THRESH0 = \<const1> ;
  VCC VCC
       (.P(\<const1> ));
  (* C_AINIT_VAL = "0" *) 
  (* C_CE_OVERRIDES_SYNC = "0" *) 
  (* C_FB_LATENCY = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_WIDTH = "16" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* c_count_by = "1" *) 
  (* c_count_mode = "0" *) 
  (* c_count_to = "1" *) 
  (* c_has_load = "0" *) 
  (* c_has_thresh0 = "0" *) 
  (* c_latency = "1" *) 
  (* c_load_low = "0" *) 
  (* c_restrict_count = "0" *) 
  (* c_thresh0_value = "1" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  c_counter_binary_0_c_counter_binary_v12_0_12_viv i_synth
       (.CE(1'b0),
        .CLK(CLK),
        .L({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .LOAD(1'b0),
        .Q(Q),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0),
        .THRESH0(NLW_i_synth_THRESH0_UNCONNECTED),
        .UP(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2015"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
INaBf8vh5mCmDzf2yp77pxZAxQdyEQiT/vG2dEgvrFjseUnGc6ldwH4JvdnpZSpdf/ihioPyMNjl
u6ooyzv5TA==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
S5XIZZtuFR/MZffuhwdnvE3H9oRWM4uXoaGZTa/Dyk62O+Wa0v41pjmZELCiR7uodZPFQfykZ6K9
2ZDMu8dB3afQRMs5lnd/53M1b9ke+MNEeZ/wzjUcsJghubnEAwzdWeW/0tlqST1WD9B/KCxYqwH5
Gj6IZTTFHAXcaVhnCT8=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
CM6IcdzP0PbD6yMSqylmi4JE2qpmxiNeI+prjGwJiD8e3Xsynu3PbGKJAOpOxtR1hT/3mpBcx1Rz
Fkz0QBh4wtE8fiziv1i+xi8T6cqC8ClamjrpZ//sn6dh7NvwSYik14MlwVuei4DZoZJZF63aoPUn
RXkQ13wtK+MkYKBcPVSZMFZmaCU6jMMBYclXzvRG1JqqZoa7mWFTeFZePUTXG7Wo12QaZ8GUi0AV
UIshoN25yn5e2Xr3FyuEtm5AvsZb+iLsgLeHBtKBnsVaHQphicgqwgwv6MQQF6ZNBgU/aACfibDS
3+n/mMMm8k1cj2bW6VCi7a+c8LmCf81NlJuLww==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ehl0CusS7+JNGq6HfhyaBMy68nccIdIGqixoEztEZfkCpXuUYsdqw6G9MIJdWdu0Ck2acV7K6IVg
rzb8/bNaDDVWp48kupToegTkOdwDkCejEqppido4BkJ+iEkjPniz+aJHlOlOwmauETy2hCMuuC57
oWDprzGWlsqbCjqzKrXmPYm6fNdcOa2DiOYstQaMFNbPU2ccrbLJAiYMHNDqtPNqWxKBsD67kiGf
2eOneDOmdmy7YkNsL+cx8MJc3BVUsYBrpAEsGyFMkmX8a8nYz8R/wlFQFGQAd/t5XrfxFNI58mj1
AHXbcAMhGKVq9YdKeU/vSXY/NwMqp12xJ1nUaw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2017_05", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
h/qRAwiPuqY/Zg/QWqbaYm8xWTi9SshYuPzyL0UME9ZDDF+C2CyGAugh9HzMdD0kZmT94TKmBgLR
dKP28nlE8VCCU5rvbjKxfn/wNtNKHCvZ1hns8CF7+pGuelhxGvXNmYKFw5co8+4grYFaDXeoZZR6
S5sjvhqtSVD3+qq4vYWRjT2Y/yes7L9dRsLq2D3iZ4xjgVHuIbOQLT/EUKW+9iYudT9Uy6YTwB+5
mSb0QK3YfZdGwZyXB4S3mdF9vNQHdW/rnACq3yngF+lprNkh3ooQKdGqtxtz8KSQxNZOAFE+koOw
h00o7AKpvDAp3uNguLvnNJH3rugOhh95b8Jatw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
TsA04vIYHDZne2CBj5bWCBFH4MtNoFDCn/3DNEi0BwutuUf+X+lD9kAO3kl352WHjQbF79Ssm+PT
fCYpODgWdxSVbzaHFpITxCQ4HcIJhUeW5PC5tw09Tand68D6eg84qRguH+llbb5jdGJkJeTCf+Mx
pupkkLiDvNyTYWe+nqw=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
rx9hgQkvaJJTJJcTjGFW1DrrWiT+xanrcMvFn0Z3KRXlZvf+SE7IQgGCiP7ZDA6T5z1Zv5nzS4h5
cVi+CvwC9UMZRWmLDAjzASJ2nx1g9BjbYe2vHAUmyurIiR6LSigTeM/9TlMv+fFwJbqwuH6FJ3/z
Vl4tIMk4NrqkMn/riOG87SjhesepM6kcQOBgDGzLTG14z3qeZG8OPzxgApfyubmX4qdD1oTgGm2u
Q4mQfFxEye6Jqkn4Rzjhifs/ieNYomHlK7R2/72QJj5j0WyYBIhvO+09izz299Z54ZP2ZXaRMfDT
lU4lQNqQU14PX9Yk9p7sy2PnK4vTwwF0CFIgSQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
HLSkwEbuIYpcK55yJvdgpUqNkaAYGUQgLz3tZv9BgN1e4xAV5GwO+EqpmVws9PgLFQrhk+YcRDyU
5nU63vJA2vc7wAZz5PD6KHKX/5zuXTFu7EV9K+W/DvpgcSxvrsoS3eJ7J51xrZAP321otK52YAdK
rHCDevD2oVjDr3oY8V3jc3eA2BiDH92agQclMbyAk9+FoYN2F0xzAFHmcE2r5fzvRikiPpKTKNlu
TMi7C9YoVih/Pm+SVrgOOlzMLkUndywz4MIk/F5rVe9XSF368bb7Z2Pn2KGqytNBfYZcdTK41pLF
h1JxSX2HUSoBhbe7vc1Ff7RpF7BF/QUDOS84tw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
hMiRSkaO/KzQulHqCwUjlaiByCRoE8FWMJ6USLJtjoru7KePmucV+nBXfZcRMNBRSTrJHx9mEQdJ
UbQK4/i2I/EFI/WkZp2hXWrSJaLIklaYriXFrnYSe/+6c7Ie8zjxbjPSHKWxykWwa2V5yfHJuE1f
fpTE+xJNKZBUVbYiNLbEJjU5toKnNgg8HO5U1cs4AA7wyz3mJLaV8wJckXud16qwS+aMtUz+BY+B
Y0M8qX6VcbfNqMMcbZ6PQdxdDetlQC8PExD1hHnBLnTp76qgor7W7V7Epmb0q5RvJfUmbrTs99lU
jlv5mmGkIOAYMqpjsePmREQAiisB5GhNjQtv0Q==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 10208)
`pragma protect data_block
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
CBLER1c=
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
