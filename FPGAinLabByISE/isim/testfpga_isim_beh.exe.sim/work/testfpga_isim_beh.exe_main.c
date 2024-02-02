/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_00000000000401302826_2460990366_init();
    work_m_00000000004049142324_2087232365_init();
    work_m_00000000000286563220_1522061686_init();
    work_m_00000000000410011701_2212969867_init();
    work_m_00000000001556377696_4179669724_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000001556377696_4179669724");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
