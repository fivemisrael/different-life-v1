// Criado por Jager Bom e Editado por ReeD
window.addEventListener('message', function(e) {
	
	//INICIAR MUSICA
    if (e.data.musiccommand == 'playsong') {
 	
	if (player != null) {
		jQuery("#player").tubeplayer("pause");
		jQuery("#player").tubeplayer("seek", 0);
	  }
		
	  console.log(e.data.songname);
	  jQuery("#player").tubeplayer("cue", e.data.songname);
	  
	  jQuery("#player").tubeplayer("play");
	  jQuery("#player").tubeplayer("volume", 0);
	  
	  
	} 
	
	//PAUSE
	else if (e.data.musiccommand == 'pause') {
	 
		jQuery("#player").tubeplayer("pause");
	 
	} 
	// STOP
	else if (e.data.musiccommand == 'stop') {
	
		jQuery("#player").tubeplayer("stop");
	  
	 
	} 
	// PLAY
	else if (e.data.musiccommand == 'play') {
	  
		jQuery("#player").tubeplayer("play");
	 
	} 
	
	// VOLUME
	
	else if (e.data.setvolume !== undefined) {
		
		if (e.data.setvolume >= 0.0 && e.data.setvolume <= 1.0) {
			var vol = e.data.setvolume;
			var corrigir = vol.toFixed(2);
			var resultado = (corrigir).replace('.','');
			var menosum = (resultado).substr(1);
			jQuery("#player").tubeplayer("volume", menosum);
			
		}
	}
	
	
});
