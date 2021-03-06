extends "res://Mini Scenes/Scenes/Tutorial.gd"


export var these_players = [['Obrulena', Texture], 
							['Kallysta', Texture], 
							['Salem', Texture]]

var this_turn_order = ['Salem', 'Kallysta', 'Obrulena']

var checked = false

# ------------------ SETUP ------------------------

# setup
func _ready():
	Global.set_advanced_enabled(false)
	game_setup(these_players, this_turn_order)
	ai_node('Obrulena').set_relations(player_character, 0)
	ai_node('Kallysta').set_relations(player_character, -1)
	ai_node('Kallysta').set_relations("Obrulena", -1)
	$SalemAI.set_portrait_visibility("Obrulena", false)
	$SalemAI.set_portrait_visibility("Kallysta", false)
	
	setup_texts()
	advance_popup(true)


func setup_texts():
	match(Global.get_language()):
		0:
			texts = [[''],
			[("In THE LONG GAME, Diplomacy doesn't only involve writing letters: players may also resend letters " +
			"from others, too.")],
			[('After the battles in the plains between Grolk and Thoren, the conflict quickly drew the attention ' +
			'of other leaders near the region.')],
			['OBRULENA, THE LOXODON came to try to bring peace and conciliation to the realm:'],
			[("Obrulena: Greetings, my child. Such brutal conflicts happening in these regions recently, don't you agree? " +
			"I hope to bring more understanding to the folk here...")],
			[('Meanwhile, KALLYSTA, THE TIEFLING seems to be preparing herself for the arrival of someone else, ' + 
			'though the specifics remain unknown.')],
			[("Kallysta: Hey. I know your type: always scheming, always planning. Well, two can play that game. " +
			"Don't even try to get close to me or the monk, or you'll get what you deserve.")],
			["Despite their many differences, the two seem to trust each other. Let's change that."],
			[('For now, simply advance your turn. In the next turn, Obrulena will send you a message declaring peace.'),
			 'Advance your turn.'],
			[('So, Obrulena has sent you a message. Once you are done reading it, click the Forgery button to get started ' +
			'on our deception campaign.'), 'Click the Forgery button.'],
			[('Our objective here is to create distrust between Obrulena and Kallysta. Kallysta has the PARANOID trait, ' +
			'meaning that any sign of hostility against herself will enrage her.')],
			[("As such, we'll modify this letter to make it look like a threat against Kallysta. Select Obrulena's letter on " +
			'the left side of the screen and alter it on the right side of it.')],
			[("Each alteration costs one Action. You'll have to make two alterations to this letter - one in the second part " +
			'of the message, and one in the third part. Good luck.'), ("Modify Obrulena's letter to make it look like a " + 
			"threat against Kallysta. You'll have to modify the second and third part of it.")],
			[("Great! Now, we only need to send it. Open Kallysta's panel and click on the button to the right of Send."),
			"Open Kallysta's panel and click on the button to the right of Send."],
			[("Select Obrulena's letter on the left side of the screen and press the Send button to use your last Action " +
			"and send the forged message to Kallysta."), ("Select Obrulena's letter and press the Send button  " +
			"to send it to Kallysta.")],
			[("And... done. Now, advance your turn to see the fruits of our deception."),
			"Advance your turn."],
			[("So far, so good. Investigate one of them and click the portrait on the right to see what transpired between " +
			"the two former allies."), ("Investigate one of them and check what transpired between Obrulena and Kallysta.")],
			[("As you can see, Kallysta has attacked Obrulena, thinking that she was going to attack first.")],
			[("An advantage of forgery is that, as far as they know, you weren't even involved! If you had instead lied to " +
			"Kallysta directly, she'd get Enraged at you for giving her false information.")],
			[("Advance your turn one final time - the unknown person Kallysta was expecting will finally arrive. ")],
			]
		1:
			texts = [[''],
			[('Em THE LONG GAME, Diplomacia n??o se resume a apenas escrever cartas: jogadores podem re-enviar ' +
			'as cartas de outros, tamb??m.')],
			[('Depois das batalhas nas plan??cies entre Grolk e Thoren, a aten????o de outros l??deres foi atra??da ' +
			'para o local.')],
			[('OBRULENA, A LOXODON veio para tentar trazer paz e concilia????o ?? regi??o:')],
			[("Obrulena: Sauda????es, minha crian??a. Conflitos t??o brutais acontecendo recentemente, n??o concorda? " +
			"Eu espero trazer mais harmonia para o povo daqui...")],
			[('Enquanto isso, KALLYSTA, A TIEFLING parece estar se preparando para a chegada de outra pessoa, ' +
			'por??m n??o deu nenhuma indica????o de quem esta pessoa seria.')],
			[("Kallysta: Ei. Eu conhe??o seu tipo, cheio de planos e conspira????es. Olha, eu tamb??m sei jogar esse jogo. " +
			"Nem tente chegar perto de mim ou da monja, ou voc?? vai se arrepender.")],
			["Apesar de suas diferen??as, as duas parecem confiar uma na outra. Vamos mudar isso."],
			[('Por enquanto, apenas avance seu turno. No turno seguinte, Obrulena ir?? enviar uma mensagem para ' +
			'voc??, declarando paz.'), 'Avance seu turno.'],
			[('Ent??o, Obrulena te enviou uma mensagem. Quando tiver terminado de l??-la, clique no bot??o de Falsifica????o ' +
			'para come??ar nossas engana????es.'), 'Clique no bot??o de Falsifica????o.'],
			[('Nosso objetivo aqui ?? criar desconfian??a entre Obrulena e Kallysta. Kallysta tem a caracter??stica PARANOIA, ' +
			'o que faz com que todo sinal de hostilidade contra ela a enraive??a.')],
			[("Assim, n??s vamos modificar esta carta para faz??-la parecer como uma amea??a contra Kallysta. Selecione a carta " +
			"de Obrulena no lado esquerdo da tela e altere-a no lado direito.")],
			[("Cada altera????o custa uma A????o. Voc?? ter?? de fazer duas altera????es nesta carta - uma na segunda parte da " +
			"mensagem, e outra na terceira. Boa sorte."), ("Modifique a carta de Obrulena para faz??-la parecer uma amea??a " +
			"contra Kallysta. Voc?? ter?? de modificar a segunda e a terceira parte dela.")],
			[("??timo! Agora, precisamos apenas envi??-la. Abra o painel de Kallysta e clique no bot??o ao lado direito de Enviar."),
			"Abra o painel de Kallysta e clique no bot??o ao lado direito de Enviar."],
			[("Selecione a carta de Obrulena no lado direito da tela e pressione Enviar para usar sua ??ltima A????o e enviar " +
			"a carta modificada para Kallysta."), ("Selecione a carta de Obrulena e pressione Enviar para envi??-la para Kallysta.")],
			[("E... pronto. Agora, avance o turno e veja os frutos de nossos planos."),"Avance o turno."],
			[("At?? agora, tudo bem. Investigue uma delas e clique no retrato no lado direito do painel para ver o que ocorreu " +
			"entre as duas l??deres."), ("Investigue uma delas e veja o que ocorreu entre Obrulena e Kallysta.")],
			[("Como voc?? pode ver, Kallysta atacou Obrulena pensando que ela iria atacar primeiro.")],
			[("Uma vantagem da Falsifica????o ?? que, at?? onde elas sabem, voc?? nem est?? envolvido! Se voc?? tivesse mentido " +
			"diretamente para a Kallysta, ela ficaria Revoltada com voc?? por ter passado informa????o falsa.")],
			[("Avance o turno uma ??ltima vez - a pessoa desconhecida que Kallysta estava esperando finalmente chegar??.")],
			]
		2:
			texts = [[''],
			[("In THE LONG GAME, Diplomatie involviert nicht nur Briefe Schreiben - Spieler k??nnen auch Briefe von anderen " +
			"Spieler wieder senden.")],
			[('Nach den K??mpfen zwischen Grolk und Thoren zog der Konflikt schnell die Aufmerksamkeit anderer F??hrer in der ' +
			'N??he der Region.')],
			['OBRULENA, DIE LOXODON ist gekommen, um zu versuchen, Frieden und Harmonie in das Reich zu bringen.'],
			[('Hingegen scheint es, dass KALLYSTA, DIE TIEFLING sich f??r die Ankunft einer andere Person vorbereitet, ' + 
			"jedoch bleiben die Details unbekannt.")],
			["Trotz ihrer mehreren Unterschiede scheinen sie einander zu vertrauen. Lasst uns das ??ndern."],
			[('F??rs Erste beende einfach deinen Zug. In der n??chsten Runde wird Obrulena dir eine Nachricht senden, ' +
			'die Frieden erkl??rt.'), 'Beende deinen Zug.'],
			[('Also hat Obrulena dir eine Nachricht geschickt. Wenn du mit dem Lesen fertig bist, klicke den F??lschung-Button, ' +
			'um unsere T??uschungen zu beginnen.'), 'Klicke den F??lschung-Button.'],
			[('Unser Ziel ist, Misstrauen zwischen Obrulena und Kallysta zu erzeugen. Kallysta hat die PARANOIA-Eigenschaft, was ' +
			'beudeutet, dass jedes Anzeichen von Feindseligkeit sie erz??rnen wird.')],
			[("Jetzt, da wir das wissen, werden wir diesen Brief ??ndern, um den so aussehen lassen, als w??re den eine Drohung " +
			'gegen Kallysta. W??hle Obrulenas Brief auf der linken Seite und ??ndere ihn auf der rechten Seite.')],
			[("Jede ??nderung kostet eine Aktion. Du musst zwei ??nderungen (in den zweiten und dritten Teil) an diesem Brief " +
			'vornehmen. Viel Gl??ck.'), ("??ndere Obrulenas Brief, um den so aussehen lassen, als w??re den eine Drohung " +
			"gegen Kallysta. Du musst zwei ??nderungen (in den zweiten und dritten Teil) an diesem Brief vornehmen.")],
			[("Gut! Jetzt mussen wir nur ihn senden. Klicke auf Kallystas Portr??t und dann auf den Button rechts von Senden. "),
			"Klicke auf Kallystas Portr??t und dann auf den Button rechts von Senden."],
			[("W??hle Obrulenas Brief in der linken Seite des Bildschirms und klicke auf den Senden-Button, um deine letzte " +
			"Aktion zu verbringen und die gef??lschte Nachricht an Kallysta zu senden."), ("W??hle Obrulenas Brief und klicke auf " +
			"den Senden-Button, um die gef??lschte Nachricht an Kallysta zu senden.")],
			[("Und... Fertig. Jetzt beende deinen Zug, um die Ergebnisse unseren T??uschungen zu sehen."),
			"Beende deinen Zug."],
			["So weit, so gut. Forsche eine von ihnen nach und pr??fe, was zwischen die zwei ehemaligen Verb??ndeten passiert ist.", 
			("Forsche eine von ihnen nach und pr??fe, was zwischen Obrulena und Kallysta passiert ist.")],
			[("Wie du sehen kannst, hat Kallysta Obrulena angegriffen, weil sie dachte, die M??nchin w??rde zuerst angreifen.")],
			[("Ein Vorteil von F??lschung ist, dass, soweit sie wissen, du nicht einmal beteiligt warst! Wenn du stattdessen " +
			"Kallysta angelogen h??ttest, w??re sie mit dir W??tend, weil du ihr falsche Informationen gegeben hattest.")],
			[("Beende deinen Zug ein letztes Mal - die unbekannte Person, die Kallysta erwartet hat, wird endlich ankommen. ")],
			]

# ------------- SIGNAL STUFF -------------------------------

func advance_turn(_char):
	_advance_turn(_char)


func _on_SalemAI_advance_turn(_character_name):
	if current_text == 15:
		advance_popup(true)
	elif current_text == 19:
		get_tree().change_scene("res://Mini Scenes/Scenes/Tutorial4.tscn")


func _on_Tutorial3_advanced_popup():
	if current_text == 3:
		$SalemAI.set_portrait_visibility("Obrulena", true)
	elif current_text == 5:
		$SalemAI.set_portrait_visibility("Kallysta", true)


func _on_SalemAI_closed_report():
	if current_text == 8:
		advance_popup(true)


func _on_SalemAI_opened_forgery():
	if current_text == 9:
		advance_popup(true)


func _on_SalemAI_forged_letter(letter):
	if (letter[1] == 'Obrulena' and letter[2] == 1 
	and letter[3] == 'Kallysta' and current_text == 12):
		advance_popup(true)


func _on_SalemAI_pressed_letters(enemy_name):
	if enemy_name == "Kallysta" and current_text == 13:
		advance_popup(true)


func _on_SalemAI_send_message(sender, package, recipient):
	if sender == "Obrulena" and current_text == 14:
		advance_popup(true)


func _on_SalemAI_pressed_info(_panel):
	if current_text == 16:
		if !checked:
			checked = true
		else:
			advance_popup(true)

func _on_SalemAI_pressed_opponent():
	if current_text == 16:
		if !checked:
			checked = true
		else:
			advance_popup(true)
