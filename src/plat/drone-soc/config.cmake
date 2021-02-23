#
# Copyright 2020, Data61, CSIRO (ABN 41 687 119 230)
#
# SPDX-License-Identifier: GPL-2.0-only
#

cmake_minimum_required(VERSION 3.7.2)

declare_platform(drone-soc KernelPlatformDroneSOC PLAT_DRONE_SOC KernelArchRiscV)

if(KernelPlatformDroneSOC)
    declare_seL4_arch(riscv64)
    config_set(KernelRiscVPlatform RISCV_PLAT "drone-soc")
    config_set(KernelPlatformFirstHartID FIRST_HART_ID 0)
    config_set(KernelOpenSBIPlatform OPENSBI_PLATFORM "fpga/drone-soc")
    list(APPEND KernelDTSList "tools/dts/drone-soc.dts")
    declare_default_headers(
        TIMER_FREQUENCY 20000000llu PLIC_MAX_NUM_INT 30
        INTERRUPT_CONTROLLER drivers/irq/riscv_plic0.h
    )
else()
    unset(KernelPlatformFirstHartID CACHE)
endif()
