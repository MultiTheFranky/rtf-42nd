class CfgWeapons {
    class U_B_CTRG_1;
    class U_B_CTRG_3;
    class UniformItem;
    class GVAR(UniformItemBase): UniformItem {
        containerClass = "Supply50";
        mass = 50;
    };

    #include "includes\rifleman.hpp"
    #include "includes\paramedic.hpp"
    #include "includes\at.hpp"
    #include "includes\lmg.hpp"
    #include "includes\officer.hpp"
    #include "includes\rto.hpp"
    #include "includes\sapper.hpp"
    #include "includes\sl.hpp"
    #include "includes\tl.hpp"
};
