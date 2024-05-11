#include "..\script_component.hpp"

/*
    * Author: Franky
    * Function that creates a particle effect on the position
    *
    * Arguments:
    * 0: OBJECT - Projectile where the particle effect will be attached
    *
    * Return Value:
    * ARRAY - Particles objects
    *
    * Example:
    * [_projectile] call rtf42_gas_fnc_createParticle;
    *
    * Public: No
*/
params ["_projectile"];
private _particle = "#particlesource" createVehicle (getPos _projectile);
private _remoteExecTarget = [0, -2] select isDedicated;
private _colorR = GVAR(gasColor) select 0;
private _colorG = GVAR(gasColor) select 1;
private _colorB = GVAR(gasColor) select 2;
[_particle, [["\A3\data_f\ParticleEffects\Universal\Universal.p3d",16,7,48,1],"","Billboard",1,10,[0,0,0],[0.2,0.1,0.5],1,1.2777,1,0.05,[0.46,4.5,18],[[_colorR,_colorG,_colorB,0.147359],[0.6,0.6,0.6,0.216584],[_colorR,_colorG,_colorB,0.487713]],[1.5,0.5],1,0.04,"","","",0,false,0,[[0,0,0,0],[0,0,0,0],[0,0,0,0]],[0,1,0]]] remoteExec ["setParticleParams", _remoteExecTarget];
[_particle, [2,[0,0,0],[0.7,0.7,0.4],10,0.5,[0,0.168141,0,0.35],0,0,0.1,1]] remoteExec ["setParticleRandom", _remoteExecTarget];
[_particle, [1,[0,GVAR(gasEffectRadio)/10,0]]] remoteExec ["setParticleCircle", _remoteExecTarget];
[_particle, 0.02] remoteExec ["setDropInterval", _remoteExecTarget];
_particle attachTo [_projectile,[0,0,0]];

private _particleInterior = "#particlesource" createVehicle (getPos _projectile);
private _remoteExecTarget = [0, -2] select isDedicated;
private _colorR = GVAR(gasColor) select 0;
private _colorG = GVAR(gasColor) select 1;
private _colorB = GVAR(gasColor) select 2;
[_particleInterior, [["\A3\data_f\ParticleEffects\Universal\Universal.p3d",16,7,48,1],"","Billboard",1,10,[0,0,0],[0.2,0.1,0.5],1,1.2777,1,0.05,[0.46,4.5,18],[[_colorR,_colorG,_colorB,0.147359],[0.6,0.6,0.6,0.216584],[_colorR,_colorG,_colorB,0.487713]],[1.5,0.5],1,0.04,"","","",0,false,0,[[0,0,0,0],[0,0,0,0],[0,0,0,0]],[0,1,0]]] remoteExec ["setParticleParams", _remoteExecTarget];
[_particleInterior, [2,[0,0,0],[0.7,0.7,0.4],10,0.5,[0,0.168141,0,0.35],0,0,0.1,1]] remoteExec ["setParticleRandom", _remoteExecTarget];
[_particleInterior, [0,[0,0,0]]] remoteExec ["setParticleCircle", _remoteExecTarget];
[_particleInterior, 0.02] remoteExec ["setDropInterval", _remoteExecTarget];
_particleInterior attachTo [_projectile,[0,0,0]];
[_particle,_particleInterior];
