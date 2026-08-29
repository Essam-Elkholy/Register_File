onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /Register_File_tb/WrData
add wave -noupdate -expand /Register_File_tb/Address
add wave -noupdate /Register_File_tb/WrEn
add wave -noupdate /Register_File_tb/RdEn
add wave -noupdate /Register_File_tb/CLK
add wave -noupdate /Register_File_tb/RST
add wave -noupdate /Register_File_tb/RdData
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ns} {53 ns}
