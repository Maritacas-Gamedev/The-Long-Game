extends "res://Mini Scenes/Scenes/Tutorial.gd"

export var these_players = [['Zardri', Texture], 
							['Drakoth', Texture], 
							['Salem', Texture]]

var this_turn_order = ['Drakoth','Salem', 'Zardri']

var checked = false
var attacked = false
var deltas = {"Zardri":0, "Drakoth":0, "Salem":0}

# ------------------ SETUP ------------------------

# setup
func _ready():
	Global.set_advanced_enabled(true)
	game_setup(these_players, this_turn_order, false)
	ai_node('Zardri').set_relations(player_character, 0)
	ai_node('Drakoth').set_relations(player_character, 0)
	
	setup_texts()
	advance_popup(true)
	
func setup_texts():
	match(Global.get_language()):
		0:
			texts = [[''],
			[("There's still another layer to THE LONG GAME: the Influence Track and the Council. ")],
			[("The Influence Track measures the amount of diplomatic power and influence a player has in the realm...")],
			[("The more Influence a player has, the earlier he acts in a turn and the more frequently they receive " +
			"attacks and letters. Additionally, the Track is also an important part of the Council.")],
			[("The Council works as follows: on every turn, the first player from the Influence " +
			"Track selects a Decree proposal. Decrees are made up of a STANCE and a TARGET.")],
			[("Following that, all other players vote on the proposal. The second player from the Track has its vote " +
			"count twice. If there are more Ayes than Nays, the Decree gets approved.")],
			[("When that happens, all players are forced to to take the selected stance against the selected target " +
			"next turn, making this a very powerful tool.")],
			[("Keep in mind, however, that both Influence and the Council may cause diplomatic relations to go down " +
			"or up depending on how you act and vote.")],
			[("With all that said, let's get to the Tutorial. For now, vote Aye on Drakoth's Proposal. We'll talk " +
			"more about him soon."), "Vote Aye on Drakoth's Proposal."],
			#^ 8
			[("Great. With the recent conflicts in the region, leaders in both high and low places have begun to watch " +
			"it more carefully in search of an opportunity to consolidate power.")],
			[("ZARDRI, THE GOBLIN is a chieftain from his tribe, and seems to be awaiting for an opportunity to strike.")],
			[("Zardri: Ghk! Human!! Yeah, you, listen: this Drakoth guy, he seems strong, doesn't he? Ye, well, " +
			"what if we stab him hard in the back, alright? Ye, no, not now, but, you know, later.")],
			[("DRAKOTH, THE DRAGONBORN, on the other hand, has claimed to come to demonstrate the power of the empire's " +
			"army and end the unrest that's been causing all this bloodshed.")],
			[("Drakoth: Greetings. I'm Drakoth, first son of Maugr, High General of the Empire, and unquestionable " +
			"Heir to the Throne. Are you the one behind this conflict? No? Well, we shall see.")],
			[("Drakoth: For now, I will enforce the peace. But I know, or at least hope, we'll meet in the battlefield. " +
			"Then, you and that green vermin will both... heh, I won't ruin the surprise.")],
			[("For now, investigate Drakoth and look into his relation with Zardri."), 
			"Investigate Drakoth and look into his relation with Zardri."],
			#^ 15
			[("So, Drakoth is hostile against Zardri. Let's advance the turn for now and see where that leads us."), 
			"Advance your turn."],
			[("Alright! Again, Drakoth is in power. This time, we'll vote Null. Voting Aye will anger Zardri, while " +
			"voting Nay will anger Drakoth. We should stay neutral for now."), "Vote Null on Drakoth's proposal."],
			[("Okay. This turn, we'll make some Influence alterations. Click the Influence button next to Forgery."), 
			"Click the Influence button next to Forgery."],
			#^ 18
			[("Players are displayed by influence rank, and the Influence alterations to each are shown to the right of " +
			"each profile.")],
			[("So, Zardri has reduced Drakoth's Influence. While doing so will help us get the throne, it will " +
			"also worsen our relations with Drakoth. We must wait for the right moment.")],
			[("What we will do instead is increase our own Influence, and Zardri's, too - the explanation for this will " +
			"come later. Increase our own Influence by 1 and Zardri's by 2 and press Finish."), 
			"Increase our own Influence by 1 and Zardri's by 2 and press Finish."],
			#^ 21
			[("Now, advance your turn."), "Advance your turn."],
			[("Again, vote Null on the proposal."), "Vote Null on the proposal."],
			[("This is the time. Last turn, we setup Zardri to become our second-in-command. Now, use 2 Actions to reduce " +
			"Drakoth's Influence, and one to attack Drakoth."), 
			"Use 2 Actions to reduce Drakoth's Influence, and one to attack Drakoth."],
			#^ 24
			[("Excellent. Let's advance the turn."), "Advance your turn."],
			[("Done! You're in power, Zardri is second. You may choose any Decree you want, but we recommend " +
			"attacking Drakoth. Anything else will get rejected by the others.")],
			[("Info about their Voting Policies can be checked by clicking the button to the right of Info. When you're done, " +
			"advance your turn."), "When you're done, advance your turn."],
			[("")]
			#^ 27
			]
		1:
			texts = [[''],
			[("Existe, ainda, mais uma camada em THE LONG GAME: a Ordem do Trono e o Conselho.")],
			[("A Ordem do Trono mede a quantidade de poder diplom??tico e influ??ncia que um jogador tem no reino.")],
			[("Quanto mais Influ??ncia um jogador tiver, o mais cedo ele age no turno e com mais frequ??ncia ele recebe " +
			"ataques e cartas. Adicionalmente, a Ordem tamb??m ?? parte importante do Conselho.")],
			[("O Conselho funciona da seguinte forma: a todo turno, o primeiro jogador da Ordem do " +
			"Trono seleciona uma proposta de Decreto. Decretos s??o formados de uma POSTURA e um ALVO.")],
			[("Depois disso, todos os outros jogadores votam na proposta. O voto do segundo jogador da Ordem vale o " +
			"dobro. Se houverem mais Sim do que N??o, o Decreto ?? aprovado.")],
			[("Quando isso acontece, todos os jogadores no pr??ximo turno s??o for??ados a tomarem a postura selecionada " +
			"contra o alvo selecionado. Isto ??, naturalmente, uma ferramenta poderosa.")],
			[("Tenha em mente, por??m, que tanto Influ??ncia quanto o Conselho podem ter repercuss??es diplom??ticas " +
			"dependendo da forma de como voc?? age e vota.")],
			[("Com isso dito, vamos ao Tutorial. Por agora, vote Sim para a proposta de Drakoth. Falaremos mais sobre " +
			"ele daqui a pouco."), "Vote Sim para a proposta de Drakoth."],
			#^ 8
			[("??timo. Com os conflitos recentes na regi??o, l??deres de diferentes c??rculos come??aram a prestar mais " +
			"aten????o, procurando oportunidades para consolidar seus poderes.")],
			[("ZARDRI, O GOBLIN ?? o chefe de sua tribo, e parece estar esperando por uma oportunidade para atacar.")],
			[("Zardri: Ghk! Humano! ??, voc??, ouve: esse Drakoth a??, ele parece fort??o, n?? n??o? ??, ??, e se a " +
			"gente dar uma bela dumas facada nas costa dele, hein? ??, tipo, depois, n??o agora.")],
			[("DRAKOTH, O DRACONIANO, por outro lado, afirma que veio para demonstrar o poder do ex??rcito do imp??rio e " +
			"acabar com o cerne de todo o derramamento de sangue.")],
			[("Drakoth: Sauda????es. Eu sou Drakoth, filho de Maugr, Alto General do Imp??rio, e inquestion??vel herdeiro" +
			"do Trono. ?? voc?? quem est?? por tr??s desse conflito? N??o...? Bem, veremos.")],
			[("Drakoth: Por agora, eu vou impor a paz. Mas eu sei, ou pelo menos espero, que nos veremos na batalha." +
			"A??, voc?? e aquele verme verde v??o ambos... heh, n??o vou arruinar a surpresa.")],
			[("Por enquanto, investigue Drakoth e veja sua rela????o com Zardri."), 
			"Investigue Drakoth e veja sua rela????o com Zardri."],
			#^ 15
			[("Ent??o Drakoth est?? hostil contra Zardri. Vamos avan??ar o turno por agora e ver o que acontece."), 
			"Avance o turno."],
			[("Ok. Drakoth est?? novamente no poder. Dessa vez, vote Nulo. Votar Sim vai irritar Zardri, enquanto que " +
			"votar N??o vai irritar Drakoth. Devemos nos manter neutros por agora."), "Vote Nulo na proposta de Drakoth."],
			[("Muito bem. Neste turno, faremos algumas altera????es de Influ??ncia. Clique no bot??o de Influ??ncia, ao lado " +
			"de Falsifica????o."), 
			"Clique no bot??o de Influ??ncia, ao lado de Falsifica????o."],
			#^ 18
			[("Jogadores s??o mostrados por n??vel de influ??ncia, e as altera????es de Influ??ncia para cada est??o ao lado " +
			"direito de cada perfil.")],
			[("Bom, Zardri reduziu a Influ??ncia de Drakoth. Fazer isso nos ajudaria a conseguir o trono, mas pioraria " +
			"nossas rela????es com Drakoth. Esperaremos pelo momento certo.")],
			[("O que faremos ao inv??s disso ?? aumentar a nossa Influ??ncia e a de Zardri - a explica????o vir?? daqui a pouco. " +
			"Aumente nossa Influ??ncia em 1, a de Zardri em 2 e pressione Finalizar."), 
			"Aumente nossa Influ??ncia em 1, a de Zardri em 2 e pressione Finalizar."],
			#^ 21
			[("Agora, avance o turno."), "Avance o turno."],
			[("Vote Nulo novamente."), "Vote Nulo novamente."],
			[("Este ?? o momento. No ??ltimo turno, preparamos Zardri para ser nosso m??o direita. Agora, use 2 A????es para " +
			"reduzir a Influ??ncia de Drakoth, e uma para atac??-lo."), 
			"Use 2 A????es para reduzir a Influ??ncia de Drakoth, e uma para atac??-lo."],
			#^ 24
			[("Excelente. Vamos avan??ar o turno."), "Avance o turno."],
			[("Feito! Voc?? est?? em poder e Zardri est?? em segundo. Voc?? pode escolher qualquer Decreto, mas " +
			"recomendamos atacar Drakoth, ou a proposta pode ser rejeitada.")],
			[("Info sobre suas Pol??ticas de Vota????o pode ser checada clicando no bot??o a direita de Info. Quando estiver " +
			"pronto, avance o turno."), "Quando estiver pronto, avance o turno."],
			[("")]
			#^ 27
			]
		2:
			texts = [[''],
			[("Es gibt noch eine weitere Schicht in THE LONG GAME: die Thron-Reihenfolge und der Rat.")],
			[("Die Thron-Reihenfolge misst den Betrag von diplomatischen Macht und Einfluss, den ein Spieler in dem Reich hat.")],
			[("Je mehr Einfluss ein Spieler hat, desto fr??her agiert er in der Runde und h??ufiger erhalt er Angriffe " +
			"und Briefe. Au??erdem ist die Reihenfolge ein wichtiger Teil des Rates.")],
			[("Der Rat funktioniert wue folgt: bei jeder Runde w??hlt der erste Spieler der Thron-Reihenfolge " +
			"einen Dekret-Vorschlag. Dekrete bestehen aus einer HALTUNG und einem ZIEL.")],
			[("Danach stimmen alle andere Spieler ??ber den Vorschlag ab. Die Stimme des zweiten Spielers der Reihenfolge " +
			"z??hlt zweimal. Wenn es mehr Ja als Nein gibt, wird das Dekret genehmigt.")],
			[("Falls das eintritt, sind alle Spieler gezwungen, die ausgew??hlte Haltung gegen das ausgew??hlte Ziel " +
			"n??chste Runde zu nehmen.")],
			[("Ber??cksichtigte aber, dass beide Einfl??ssen und der Rat diplomatische Relationen auswirken " +
			"k??nnen, je nachdem, wie du stimmst und agierst.")],
			[("Angesichts dessen, lassen uns mit dem Tutorial anfangen. F??rs Erste stimme Ja auf Drakoths Vorschlag ab. " +
			"Bald werden wir weiter ??ber ihn erkl??ren."), "Stimme Ja auf Drakoths Vorschlag ab."],
			#^ 8
			[("Gut. Mit den k??rzlichen Konflikten haben F??hrer von verschiedenen Schichten angefangen, auf der Suche nach " +
			"Machtkonsolidierung den Bereich sorgf??ltiger zu ??berwachen.")],
			[("ZARDRI, DER KOBOLD ist ein H??uptling seines Stammes, und scheint, auf eine Gelegenheit zum Schlagen zu warten.")],
			[("Zardri: Ghk! Mensch! Ja, du, h??r mal: dieser Drakoth-Typ, er scheint stark, oder? Ja, na ja, was ist, " +
			"wenn wir ihm hart in der R??cken fallen, eh? Nee, doch, nicht jetzt, aber, wei??t du, sp??ter.")],
			[("Auf der anderen Seite hat DRAKOTH, DER DRACHENGEBORENE behauptet, dass er kommt, um der Macht des Reiches " +
			"zu demonstrieren und alle diese Unruhen zu enden.")],
			[("Drakoth: Gr????e. Ich bin Drakoth, Hochgeneral des Reiches und unzweifelhafter Thronfolger. Bist du derjeniger, " +
			"der hinter diesem Konflikt steht? Nein? Hm, wir werden sehen.")],
			[("Drakoth: F??rs Erste werde ich die Friede erzwingen. Aber ich wei??, wir eines Tages in " +
			"K??mpf treffen werden. Und dann, du und der Kobold... heh, nein, ich verrate es nicht.")],
			[("F??rs Erste, forsche Drakoth nach und pr??fe seine Relation mit Zardri."), 
			"Forsche Drakoth nach und pr??fe seine Relation mit Zardri."],
			#^ 15
			[("Also steht Drakoth feindselig gegen??ber Zardri. Lass uns die Runde beenden und sehen, was passiert."), 
			"Beende die Runde."],
			[("Gut! Drakoth ist wieder an der Macht. Diesmal werden wir Null abstimmen. 'Ja' w??rde Zardri ??rgern, " +
			"w??hrend 'Nein' Drakoth ??rgern w??rde. Wir sollten neutral bleiben."), "Stimme Nein auf Drakoths Vorschlag ab."],
			[("Okay. Diese Runde werden wir Einfluss-??nderungen machen. Klicke auf dem Einfluss-Button neben 'F??lschung'."),
			"Klicke auf dem Einfluss-Button neben 'F??lschung'."],
			#^ 18
			[("Die Spieler werden nach Einflussrang angezeigt, und ihre Einfluss-??nderungen werden rechts neben ihrem Port??ts gezeit.")],
			[("Also hat Zardri Drakoths Einfluss reduziert. Obwohl das uns helfen wird, den Thron zu erobern, wird es " +
			"unsere Relation mit Drakoth verschlechtern. Wir m??ssen warten.")],
			[("Was wir stattdessen tun werden, ist, unsere eigene und Zardris Einfluss zu erh??hen. " +
			"Erh??he unseren Einfluss um 1 und Zardris um 2 und dr??cke Abschlie??en."), 
			"Erh??he unseren Einfluss um 1 und Zardris um 2 und dr??cke Abschlie??en."],
			#^ 21
			[("Jetzt beende die Runde."), "Beende die Runde."],
			[("Stimme wieder Null auf den Vorschlag ab."), "Stimme Null auf den Vorschlag ab."],
			[("Letzte Runde haben wir Zardri vorbereitet, die zweite Position zu erreichen. Verbringe " +
			"2 Aktionen, um Drakoths Einfluss zu reduzieren, und eine, um Drakoth anzugreifen."), 
			"Verbringe 2 Aktionen, um Drakoths Einfluss zu reduzieren, und eine, um Drakoth anzugreifen."],
			#^ 24
			[("Gr????artig. Lassen uns die Runde beenden."), "Beende die Runde."],
			[("Fertig. Du bist an der Macht, Zardri ist zweiter. Du kannst jedes Dekret w??hlen, aber wir " +
			"empfehlen, Drakoth angreifen. Alles andere wird nicht abgelehnt.")],
			[("Info ??ber Abstimmungspolitik k??nnen gepr??ft werden, indem du den Button rechts neben von Info klickst. Wenn " +
			"du fertig bist, beende die Runde."), "Wenn du fertig bist, beende die Runde."],
			[("")]
			#^ 27
			]


# ------------- SIGNAL STUFF -------------------------------


func advance_turn(_char):
	_advance_turn(_char)


func _on_Tutorial5_received_vote(voter, vote):
	if (current_text == 8 and vote == 1) or ((current_text == 17 or current_text == 23) and vote == 0):
		advance_popup(true)


func _on_SalemAI_pressed_info(enemy_name):
	if current_text == 15 and enemy_name == 'Drakoth':
		checked = true


func _on_SalemAI_pressed_opponent():
	if current_text == 15:
		if checked:
			advance_popup(true)


func _on_SalemAI_advance_turn(_char):
	if current_text == 16 or current_text == 22 or current_text == 25:
		advance_popup(true)
	elif current_text == 27:
		get_tree().change_scene("res://Mini Scenes/Scenes/Tutorial6.tscn")


func _on_SalemAI_pressed_influence():
	if current_text == 18:
		advance_popup(true)


func _on_Tutorial5_changed_influence(change, character_name, target):
	if current_text == 21:
		deltas[target] += change
		
		if deltas["Zardri"] == 2 and deltas["Salem"] == 1:
			advance_popup(true)
	elif current_text == 24:
		deltas[target] += change
		
		if deltas["Drakoth"] == -2 and attacked:
			advance_popup(true)


func _on_SalemAI_changed_stance():
	if current_text == 24:
		attacked = true
		if deltas["Drakoth"] == -2 and attacked:
			advance_popup(true)
