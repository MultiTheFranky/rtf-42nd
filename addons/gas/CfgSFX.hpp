class CfgSFX {
    class GVAR(Cough_Min) {
        sound0[] = {"a3\Sounds_F\characters\human-sfx\P01\Breath_Max_01",1.7782794,1.0,5,0.25,1,1,1};
        sound1[] = {"a3\Sounds_F\characters\human-sfx\P01\Breath_Max_13z",1.7782794,1.0,5,0.25,1,1,1};
        sound2[] = {"a3\Sounds_F\characters\human-sfx\P01\Breath_Max_14z",1.7782794,1.0,5,0.25,1,1,1};
        sound3[] = {"a3\Sounds_F\characters\human-sfx\P01\Breath_Max_04",1.7782794,1.0,5,0.25,1,1,1};
        sounds[] = {"sound0","sound1","sound2","sound3"};
        empty[] = {"",0,0,0,0,0,0,0};
    };
    class GVAR(Cough_Mid): GVAR(Cough_Min) {
        sound0[] = {"a3\Sounds_F\characters\human-sfx\Person0\P0_breath_damage_mid_11_zakuck",1.7782794,1.0,5,0.25,1,1,1};
        sound1[] = {"a3\Sounds_F\characters\human-sfx\Person0\P0_breath_mid_07_zakuck",1.7782794,1.0,5,0.25,1,1,1};
        sound2[] = {"a3\Sounds_F\characters\human-sfx\Person0\P0_choke_02",1.7782794,1.0,5,0.25,3,3,3};
        sound3[] = {"a3\Sounds_F\characters\human-sfx\Person0\P0_choke_04",1.7782794,1.0,5,0.25,3,3,3};
    };
    class GVAR(Cough_Max): GVAR(Cough_Min) {
        sound0[] = {"a3\Sounds_F\characters\human-sfx\P01\drowning_01",1.7782794,1.0,5,0.25,3,3,3};
        sound1[] = {"a3\Sounds_F\characters\human-sfx\P01\drowning_02",1.7782794,1.0,5,0.25,3,3,3};
        sound2[] = {"a3\Sounds_F\characters\human-sfx\P12\drowning_2",1.7782794,1.0,5,0.25,6,6,6};
        sound3[] = {"a3\Sounds_F\characters\human-sfx\P18\drowning_1",1.7782794,1.0,5,0.25,3,3,3};
    };
    class GVAR(Cough_Custom): GVAR(Cough_Min) {
        sound0[] = {QPATHTOF(sounds\cough1),1.7782794,1.0,5,0.25,1,1,1};
        sound1[] = {QPATHTOF(sounds\cough2),1.7782794,1.0,5,0.25,1,1,1};
        sound2[] = {QPATHTOF(sounds\cough3),1.7782794,1.0,5,0.25,1,1,1};
        sound3[] = {QPATHTOF(sounds\cough4),1.7782794,1.0,5,0.25,1,1,1};
        sound4[] = {QPATHTOF(sounds\cough5),1.7782794,1.0,5,0.25,1,1,1};
        sound5[] = {QPATHTOF(sounds\cough6),1.7782794,1.0,5,0.25,1,1,1};
        sound6[] = {QPATHTOF(sounds\cough7),1.7782794,1.0,5,0.25,1,1,1};
        sound7[] = {QPATHTOF(sounds\cough8),1.7782794,1.0,5,0.25,1,1,1};
        sounds[] = {"sound0","sound1","sound2","sound3","sound4","sound5","sound6","sound7"};
    };
    class GVAR(Breath): GVAR(Cough_Min) {
        sound0[] = {"a3\Sounds_F\characters\human-sfx\P01\Breath_Aiming_1",1.7782794,1.0,5,0.25,1,1,1};
        sound1[] = {"a3\Sounds_F\characters\human-sfx\P01\Breath_Aiming_2",1.7782794,1.0,5,0.25,1,1,1};
        sound2[] = {"a3\Sounds_F\characters\human-sfx\P02\Breath_Aiming_1",1.7782794,1.0,5,0.25,1,1,1};
        sound3[] = {"a3\Sounds_F\characters\human-sfx\P02\Breath_Aiming_2",1.7782794,1.0,5,0.25,1,1,1};
    };
};