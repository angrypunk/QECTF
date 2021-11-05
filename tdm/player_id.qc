/*----------------------------------------------------------------------
 IDGlobe.qc - Stan Smith (StoshSmith@worldnet.att.net) - 23 August 1996

	This routine adds an ID-globe (works about like IFF).  When
aimed at another entity, it prints friend or foe, their netname, and
current weapon. If you keep it aimed at them, it'll update every three
game seconds.  It'll also ID monsters, though it's a wee-bit of a
hack. (Quake-C uses ugly monster classnames, and doesn't register their
weapons properly.  If you make your own creatures, please set the
classnames to something cool!)
	I also left in the lines that will make the IDGlobe work like a
light; if you wanna use it as such, remove the //'s before the four
rem'ed lines.  If the light/ID globe is aimed at a monster, it'll make
them target you [almost] immediately.
	If you have any questions, either email me, or visit any of the
excellent Quake pages online (such as http://www.nuc.net/quake).

---DIRECTIONS FOR INSTALLATION:-----------------------------------------
**** Add the following 3 lines to the 'player only fields' in defs.qc:
.float ID_inuse;		// Is ID Globe on?  1=Yes 0=No
.float ID_time;		// Time until next ID unless re-aimed
.entity ID_ent;		// Last entity ID'ed
**** Add the following line to W_Precache() in weapons.qc:
precache_sound("buttons/Switch21.wav");
  ** and the following 2 lines to ImpulseCommands() in weapons.qc:
 	if(self.impulse==15)
 		ID_toggle();
**** Modify progs.src to insert the following line before weapons.qc:
IDglobe.qc 
**** Modify the config.cfg in your game source directory to add:
bind i "impulse 15"  (change i to the key you want to use)
----------------------------------------------------------------------*/
void() ID_aim={
	local vector src;
	local entity me;
	local float temp;
	me=self.owner;
	if(!me.ID_inuse){
		remove(self);
		return;}
	makevectors(me.v_angle);
	src=me.origin+v_forward*10;
	src_z=me.absmin_z+me.size_z*0.7;
	traceline(src,src+v_forward*2048,FALSE,me);
	setorigin(self,trace_endpos-v_forward*10);
	self.nextthink=time+0.1;
	if(me.ID_ent!=trace_ent||time>me.ID_time){
		if(trace_ent.classname=="player"){
			if(trace_ent.team!=me.team) sprint(me,"ENEMY: ");
			else sprint(me,"FRIEND: ");
			sprint(me,trace_ent.netname);
			temp=trace_ent.weapon;
			if(temp==IT_AXE) sprint(me,"- Axe");
			else if(temp==IT_SHOTGUN) sprint(me,"- Shotgun");
			else if(temp==IT_SUPER_SHOTGUN) sprint(me,"- Super Shotgun");
			else if(temp==IT_NAILGUN) sprint(me,"- Nailgun");
			else if(temp==IT_SUPER_NAILGUN) sprint(me,"- Super Nailgun");
			else if(temp==IT_GRENADE_LAUNCHER) sprint(me,"- Grenade Launcher");
			else if(temp==IT_ROCKET_LAUNCHER) sprint(me,"- Rocket Launcher");
			else if(temp==IT_LIGHTNING) sprint(me,"- Lightning Gun");
			else sprint(me,"- Unknown Weapon");}
		else if(!me.deadflag&&trace_ent.flags&FL_MONSTER){
//			trace_ent.enemy=me;
//			trace_ent.nextthink=time+0.2;
//			trace_ent.think=FoundTarget;
			sprint(me,"ID: ");
			if(trace_ent.classname=="monster_ogre") sprint(me,"Ogre (Chainsaw/grenades)");
			else if(trace_ent.classname=="monster_knight") sprint(me,"Knight (Sword)");
			else if(trace_ent.classname=="monster_shambler") sprint(me,"Shambler (Claws/lightning bolt)");
			else if(trace_ent.classname=="monster_demon1") sprint(me,"Fiend (Claws/horns)");
			else if(trace_ent.classname=="monster_wizard") sprint(me,"Scrag (Particle beam)");
			else if(trace_ent.classname=="monster_zombie") sprint(me,"Zombie (Chunks 'o flesh)");
			else if(trace_ent.classname=="monster_dog") sprint(me,"Rottweiler (Teeth/claws)");
			else if(trace_ent.classname=="monster_hell_knight") sprint(me,"Death Knight (Sword/flame fan)");
			else if(trace_ent.classname=="monster_tarbaby") sprint(me,"Spawn (Corrosive touch)");
			else if(trace_ent.classname=="monster_fish") sprint(me,"Rotfish (Teeth)");
			else if(trace_ent.classname=="monster_shalrath") sprint(me,"Vore (Firepod)");
			else if(trace_ent.classname=="monster_enforcer") sprint(me,"Enforcer (Laser rifle)");
			else if(trace_ent.classname=="monster_army") sprint(me,"Grunt (Shotgun)");
			else sprint(me,trace_ent.classname);}
		else return;
		sprint(me,"\n");
		me.ID_time=time+3;
		me.ID_ent=trace_ent;}};

void() ID_toggle={
	local entity temp;
	if(self.ID_inuse){
		sprint(self,"I.D. globe off\n");
		//sound(self,CHAN_WEAPON,"buttons/Switch21.wav",1,ATTN_NORM);
		self.ID_inuse=0;}
	else{
		//sprint(self,"I.D. globe on\n");
		//sound(self,CHAN_VOICE,"buttons/Switch21.wav",1,ATTN_NORM);
		self.ID_inuse=1;
		temp=spawn();
		setorigin(temp,self.origin);
		//setmodel(temp,"progs/s_bubble.spr");
		setsize(temp,'0 0 0','0 0 0');
		temp.classname="IDGlobe";
		temp.movetype=MOVETYPE_NONE;
		temp.solid=SOLID_NOT;
//		temp.effects=EF_DIMLIGHT;
		temp.owner=self;
		temp.nextthink=time+0.1;
		temp.think=ID_aim;}};
