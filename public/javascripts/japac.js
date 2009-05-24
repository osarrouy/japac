/* Fonctions d'affichage des marqueurs Google Map */

function createMarker(point, msg) {
	var marker = new GMarker(point);
	GEvent.addListener(marker, "click", function() {
		marker.openInfoWindowHtml(msg);
	});
	return marker;
}

/* Fonctions d'affichage des photos */

function getPhoto(id) {

	new Ajax.Request('/photos/' + id + '.js', {
			method: 'get',
	  		onComplete: function(transport) { 
				var newImage = new Image();
				newImage.onload = (function(){
			        newHeight = newImage.height;
					new Effect.Morph('photo_wide_wrapper', { style: { height: newHeight + 'px' },
							duration: 0.5, queue: { position: 'front', scope: 'photoscope' } });
					new Effect.Fade('spinner', { duration: 0, queue: { position: 'end', scope: 'photoscope' } });
					new Effect.Appear('photo_wide', { duration: 0.5, queue: { position: 'end', scope: 'photoscope' } });
			    }).bind(this);

				newImage.src = transport.responseText;
				$('photo_wide_inner').update(newImage);
			}
		}
	);
	
	return false;
}

function switchPhoto(id) {
	
	var originalHeight = $('photo_wide_wrapper').getHeight();
	$('photo_wide_wrapper').setStyle({ height: originalHeight + 'px' });
		
	new Effect.Fade('photo_wide', { duration: 0.5, queue: { position: 'front', scope: 'photoscope' } });
	new Effect.Appear('spinner', { duration: 0, queue: { position: 'end', scope: 'photoscope' } });

  	getPhoto.delay(1, id);

	return false;
}

/* Fonctions d'affichage des informations */

function switchInfoOn(transport) {

	$('photo_wide_inner').update(transport.responseText);
	$('photo_wide').show();
	var newHeight = $('photo_wide_inner').getHeight();
	$('photo_wide').hide();
	
	new Effect.Morph('photo_wide_wrapper', { style: { height: newHeight + 'px' },
				duration: 0.5, queue: { position: 'front', scope: 'photoscope' } });
	new Effect.Fade('spinner', { duration: 0, queue: { position: 'end', scope: 'photoscope' } });
	new Effect.Appear('photo_wide', { duration: 0.5, queue: { position: 'end', scope: 'photoscope' } });
	
	return false;
}

/* Fonctions d'affichage des informations d'une actualité */

function getEventInfo(id) {
	
	new Ajax.Request('/events/' + id + '.js', {
		method: 'get',
		onComplete: function(transport) { switchInfoOn(transport); }
	});

	return false;
}

function switchEventInfo(id) {
	var originalHeight = $('photo_wide_wrapper').getHeight();
	$('photo_wide_wrapper').setStyle({ height: originalHeight + 'px' });
	
	new Effect.Fade('photo_wide', { duration: 0.5, queue: { position: 'front', scope: 'photoscope' } });
	new Effect.Appear('spinner', { duration: 0, queue: { position: 'end', scope: 'photoscope' } });
  
	getEventInfo.delay(1, id);

	return false;
}

/* Fonctions d'affichage des informations d'une référence */

function getReferenceInfo(id) {
	
	new Ajax.Request('/references/' + id + '.js', {
		method: 'get',
		onComplete: function(transport) { switchInfoOn(transport) }
	});

	return false;
}

function switchReferenceInfo(id) {
	var originalHeight = $('photo_wide_wrapper').getHeight();
	$('photo_wide_wrapper').setStyle({ height: originalHeight + 'px' });
	
	new Effect.Fade('photo_wide', { duration: 0.5, queue: { position: 'front', scope: 'photoscope' } });
	new Effect.Appear('spinner', { duration: 0, queue: { position: 'end', scope: 'photoscope' } });
  
	getReferenceInfo.delay(1, id);

	return false;
}