class CfgFaces {
    class Default {
        class Custom;
    };
    class Man_A3: Default {
        class Pettka;
        class GVAR(Rubi): Pettka {
            displayname="Rubi";
            texture=QPATHTOF(data\rubi.paa);
            head=QGVAR(Rubi);
            identityTypes[]= {"Head_Euro","Head_NATO"};
            author=ECSTRING(main,Author);
            material=QPATHTOF(data\rubi.rvmat);
            materialHL="";
            materialHL2="";
            textureHL=QPATHTOF(data\rubi_bald_co.paa);
            textureHL2=QPATHTOF(data\rubi_bald_co.paa);
            disabled=0;
        };
    };
};