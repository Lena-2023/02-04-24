iverilog -o qqq note2dds_1st_gen.v dds.v form_wave.v tform_wave.v
vvp qqq
gtkwave bench.vcd