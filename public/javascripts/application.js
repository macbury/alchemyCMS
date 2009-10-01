var scroll = 1877;

function movingBackground(){
	scroll -= 1;
	$('body').style.backgroundPosition = scroll+'px center';
	setTimeout('movingBackground()',100);
}

function turnLoader(state){
	if (state) {
		Effect.Appear('loader');
	}else{
		Effect.Fade('loader');
	}
	$('form_logowanie').disabled = state
}

function initApp(){
	Effect.Fade('black');
	turnLoader(false);
	movingBackground();
}