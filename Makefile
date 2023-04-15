test:
	@echo "Verilating..."
	verilator --cc ledmodule.v
	@echo "Compiling..."
	verilator --trace --exe --build --cc ledmodule.v ledmodule.cpp
	@echo "Building..."
	./obj_dir/Vledmodule
	@echo "Running..."
	gtkwave waveform.vcd
