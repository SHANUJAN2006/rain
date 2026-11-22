import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles

@cocotb.test()
async def test_project(dut):
    dut._log.info("Start Rain Alert Test")

    clock = Clock(dut.clk, 10, units="us")
    cocotb.start_soon(clock.start())

    # Reset
    dut.ena.value = 1
    dut.ui_in.value = 0
    dut.uio_in.value = 0
    dut.rst_n.value = 0
    await ClockCycles(dut.clk, 5)
    dut.rst_n.value = 1
    await ClockCycles(dut.clk, 2)

    # Test 1: Dry weather (Humidity = 5) -> Output 0
    dut.ui_in.value = 5
    await ClockCycles(dut.clk, 2)
    assert dut.uo_out.value == 0

    # Test 2: Rain Warning (Humidity = 11 + Low pressure bit 4) -> Output bit 0 = 1
    dut.ui_in.value = 11 | (1 << 4)
    await ClockCycles(dut.clk, 2)
    assert (int(dut.uo_out.value) & 1) == 1

    # Test 3: Rain Detected (Rain sensor bit 5 = 1) -> Output bit 1 = 1
    dut.ui_in.value = (1 << 5)
    await ClockCycles(dut.clk, 2)
    assert (int(dut.uo_out.value) & 2) == 2


    
