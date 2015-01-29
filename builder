///////////////////////////////////////////////////////////////////
module.exports = function (creep) {//0
if(creep.memory.role == 'Builder') {//1
///////////////////////////////////////////////////////////////////
  
    var targets = creep.room.find(Game.CONSTRUCTION_SITES);
    var exten = Game.creeps.Build.room.find(Game.STRUCTURES,{     
        filter: function(object) { 
        return (object.structureType===Game.STRUCTURE_EXTENSION);    
        } });
    
    var wor = creep.room.find(Game.CREEPS, {
    filter: function(object) {
    return object.getActiveBodyparts(Game.CARRY) > 0 && object.getActiveBodyparts(Game.WORK)>0;}
        });
    var i;    
    
///////////////////////////////////////////////////////////////////
    if (wor.length) {//2
    
        if(targets.length)  {//3
            
            for (i=0; i<wor.length; i++) {//4
                wor[i].moveTo(targets[0].pos.x+1,targets[0].pos.y+i);
                wor[i].build(targets[0]);
                //break;
            }//4
        }//3
      
    else    {//5
        
        if(creep.energy === 0) {//6
            creep.moveTo(Game.spawns.Spawn1);   
            Game.spawns.Spawn1.transferEnergy(creep);   
        }//6
    
    else{//7
        
        for (i=0; i<exten.length; i++)  {//8
        
            if (exten[i].energy<200)   {//9
                //for (i=0; i<exten.length; i++)  {//8
                creep.moveTo(exten[i]); 
	            creep.transferEnergy(exten[i]);
            }//9
        }//8
        }//7
    }//5
    }//2
///////////////////////////////////////////////////////////////////
}//1
}//0
