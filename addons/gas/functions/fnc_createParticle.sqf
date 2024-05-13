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
private _colorA = GVAR(gasColor) select 3;
[_particle, [["\A3\data_f\ParticleEffects\Universal\Universal",16,12,8,0],"","Billboard",1,20,[0,0,0],[0,0,0],1,2,1.2,0.5,[2,6,8.8],[
    [_colorR * 0.5,_colorG * 0.5,_colorB * 0.5,_colorA * 0.1],
    [_colorR * 0.6,_colorG * 0.6,_colorB * 0.6,_colorA * 0.06],
    [_colorR * 0.7,_colorG * 0.7,_colorB * 0.7,_colorA * 0.04],
    [_colorR * 0.8,_colorG * 0.8,_colorB * 0.8,_colorA * 0.005],
    [_colorR * 0.9,_colorG * 0.9,_colorB * 0.9,_colorA * 0.003]
],[5],0.1,0.1,"","","",0,false,0,[[0,0,0,0]]]] remoteExec ["setParticleParams", _remoteExecTarget];
[_particle, [5.2,[0.3,0.3,0.3],[1.8,1.8,1.8],20,0.15,[0,0,0,0],0,0,1,0]] remoteExec ["setParticleRandom", _remoteExecTarget];
[_particle, [GVAR(gasEffectRadio) / 2,[GVAR(gasEffectRadio),GVAR(gasEffectRadio),0]]] remoteExec ["setParticleCircle", _remoteExecTarget];
[_particle, 0.001] remoteExec ["setDropInterval", _remoteExecTarget];
_particle attachTo [_projectile,[0,0,0]];

private _particleInterior = "#particlesource" createVehicle (getPos _projectile);
private _remoteExecTarget = [0, -2] select isDedicated;
private _colorR = GVAR(gasColor) select 0;
private _colorG = GVAR(gasColor) select 1;
private _colorB = GVAR(gasColor) select 2;
[_particleInterior, [["\A3\data_f\ParticleEffects\Universal\Universal",16,12,8,0],"","Billboard",1,20,[0,0,0],[0,0,0],1,1.5,1.2,0.5,[2,6,8.8],[
    [_colorR * 0.5,_colorG * 0.5,_colorB * 0.5,_colorA * 0.2],
    [_colorR * 0.6,_colorG * 0.6,_colorB * 0.6,_colorA * 0.1],
    [_colorR * 0.7,_colorG * 0.7,_colorB * 0.7,_colorA * 0.06],
    [_colorR * 0.8,_colorG * 0.8,_colorB * 0.8,_colorA * 0.04],
    [_colorR * 0.9,_colorG * 0.9,_colorB * 0.9,_colorA * 0.006]
],[5],0.1,0.1,"","","",0,false,0,[[0,0,0,0]]]] remoteExec ["setParticleParams", _remoteExecTarget];
[_particleInterior, [5.2,[0.3,0.3,0.3],[1.8,1.8,1.8],20,0.15,[0,0,0,0],0,0,1,0]] remoteExec ["setParticleRandom", _remoteExecTarget];
[_particleInterior, [0,[0,0,0]]] remoteExec ["setParticleCircle", _remoteExecTarget];
[_particleInterior, 0.005] remoteExec ["setDropInterval", _remoteExecTarget];
_particleInterior attachTo [_projectile,[0,0,0]];

private _particleMid = "#particlesource" createVehicle (getPos _projectile);
private _remoteExecTarget = [0, -2] select isDedicated;
private _colorR = GVAR(gasColor) select 0;
private _colorG = GVAR(gasColor) select 1;
private _colorB = GVAR(gasColor) select 2;
[_particleMid, [["\A3\data_f\ParticleEffects\Universal\Universal",16,12,8,0],"","Billboard",1,20,[0,0,0],[0,0,0],1,2,1.2,0.5,[2,6,8.8],[
    [_colorR * 0.5,_colorG * 0.5,_colorB * 0.5,_colorA * 0.2],
    [_colorR * 0.6,_colorG * 0.6,_colorB * 0.6,_colorA * 0.1],
    [_colorR * 0.7,_colorG * 0.7,_colorB * 0.7,_colorA * 0.06],
    [_colorR * 0.8,_colorG * 0.8,_colorB * 0.8,_colorA * 0.04],
    [_colorR * 0.9,_colorG * 0.9,_colorB * 0.9,_colorA * 0.006]
],[5],0.1,0.1,"","","",0,false,0,[[0,0,0,0]]]] remoteExec ["setParticleParams", _remoteExecTarget];
[_particleMid, [5.2,[0.3,0.3,0.3],[1.8,1.8,1.8],20,0.15,[0,0,0,0],0,0,1,0]] remoteExec ["setParticleRandom", _remoteExecTarget];
[_particleMid, [5,[5,5,0]]] remoteExec ["setParticleCircle", _remoteExecTarget];
[_particleMid, 0.005] remoteExec ["setDropInterval", _remoteExecTarget];
_particleMid attachTo [_projectile,[0,0,0]];

private _particleMid2 = "#particlesource" createVehicle (getPos _projectile);
private _remoteExecTarget = [0, -2] select isDedicated;
private _colorR = GVAR(gasColor) select 0;
private _colorG = GVAR(gasColor) select 1;
private _colorB = GVAR(gasColor) select 2;
[_particleMid2, [["\A3\data_f\ParticleEffects\Universal\Universal",16,12,8,0],"","Billboard",1,20,[0,0,0],[0,0,0],1,2,1.2,0.5,[2,6,8.8],[
    [_colorR * 0.5,_colorG * 0.5,_colorB * 0.5,_colorA * 0.2],
    [_colorR * 0.6,_colorG * 0.6,_colorB * 0.6,_colorA * 0.1],
    [_colorR * 0.7,_colorG * 0.7,_colorB * 0.7,_colorA * 0.06],
    [_colorR * 0.8,_colorG * 0.8,_colorB * 0.8,_colorA * 0.04],
    [_colorR * 0.9,_colorG * 0.9,_colorB * 0.9,_colorA * 0.006]
],[5],0.1,0.1,"","","",0,false,0,[[0,0,0,0]]]] remoteExec ["setParticleParams", _remoteExecTarget];
[_particleMid2, [5.2,[0.3,0.3,0.3],[1.8,1.8,1.8],20,0.15,[0,0,0,0],0,0,1,0]] remoteExec ["setParticleRandom", _remoteExecTarget];
[_particleMid2, [5,[5,5,0]]] remoteExec ["setParticleCircle", _remoteExecTarget];
[_particleMid2, 0.005] remoteExec ["setDropInterval", _remoteExecTarget];
_particleMid2 attachTo [_projectile,[0,0,0]];





[_particle,_particleInterior,_particleMid,_particleMid2];
