extends "res://Mini Scenes/Scenes/Tutorial.gd"


export var these_players = [['Grolk', Texture], 
							['Daint', Texture], 
							['Salem', Texture]]

var this_turn_order = ['Salem', 'Daint', 'Grolk']

# ------------------ SETUP ------------------------

# setup
func _ready():
	Global.set_advanced_enabled(false)
	game_setup(these_players, this_turn_order)
	ai_node('Grolk').set_relations(player_character, -1)
	
	setup_texts()
	advance_popup(true)


func setup_texts():
	match(Global.get_language()):
		0:
			texts = [[''],
			[('The Long Game is a diplomacy/intrigue game. Its main mechanic revolves around the Prisoner\'s Dilemma - ' +
			 'a game theory-related thought experiment.')],
			[('At every turn, every player chooses a Stance (Passive/Agressive) towards another player. To change Stances, ' +
			 'click on the button below a player\'s portrait.'), ('Change Stances, ' + 
			'clicking on the button below a player\'s portrait.')],
			[('Good. In general, the Passive Stance is better diplomatically and is beneficial for both players, ' + 
			'but it exposes the player to getting betrayed.')],
			[('On the other hand, the Agressive Stance is better for the individual, though it costs an Action ' + 
			'and creates resentment between players.')],
			[('The game lasts 6 rounds, and each player has 3 Actions per round. Aside from Attack, Actions can also ' + 
			'be spent on INVESTIGATION and DIPLOMACY.')],
			[('Investigations are great for obtaining crucial information on other players. ' +
			'To investigate someone, click on their portrait and then on INFO.')],
			['Investigate GROLK, THE ORC.', 'Investigate GROLK, THE ORC, clicking on his portrait and then on INFO.'],
			[('Grolk trusts you, but it is possible to know his opinion towards all other players as well. ' + 
			'Click on the portrait on the right side of the panel to change the other character.'), ('Click on the portrait ' + 
			'on the right side of the panel to change the other character.')],
			[('Good. So, Grolk trusts you, but doesn\'t trust Daint. That could be used as a weapon... '+
			'We\'ll see how to do that up ahead.')],
			[('Each NPC has a distinct personality, which can be examined by clicking on the button to the right of INFO. '+
			'Pay extra attention to the sections BROTHERHOOD and SIMPLE-MINDED.'), ('Click on the button to the ' + 
			'right of INFO. Pay extra attention to the sections BROTHERHOOD and SIMPLE-MINDED.')],
			[('Grolk always trusts his allies, and becomes Hostile to anyone that attacks them. With these traits, '+
			'it is possible to influence him to attack another person.')],
			[('The message that we want to give is that Daint will attack us. To do that, we\'ll use Diplomacy ' + 
			'to send a letter to Grolk.')],
			['Select the appropriate options on Grolk\'s Diplomacy Area and click Send.', ('Send a message saying that ' + 
			'Daint will attack us. Select the appropriate options on Grolk\'s Diplomacy Area and click Send.')],
			[('Grolk:\nMiserable traitorous dwarf! Brother, do not worry. My men will kill, cut and skin every ' +
			'little one they can find!')],
			['Good! Now, advance your turn.', 'Advance your turn.']]
		1:
			texts = [[''],
			[('The Long Game ?? um jogo de diplomacia e intriga. Sua principal mec??nica gira em torno do Dilema do Prisioneiro - ' +
			 'um experimento mental sobre teoria de jogos.')],
			[('A todo turno, cada jogador escolhe uma Postura (Passiva/Agressiva) em rela????o a outro jogador. ' +
			 'Para trocar de Postura, clique no bot??o abaixo do perfil de um jogador.'), ('Troque de Postura, ' + 
			'clicando no bot??o abaixo do perfil de um jogador.')],
			[('Muito bem. No geral, a postura Passiva ?? mais diplom??tica e melhor para o grupo, ' + 
			'mas abre o jogador ?? possibilidade de ser tra??do.')],
			[('Por outro lado, a postura Agressiva ?? melhor para o ind??viduo, ' + 
			'por??m custa uma A????o e cria resentimento entre jogadores.')],
			[('O jogo dura 6 rounds, e cada jogador tem 3 A????es por round. Al??m de Ataque, A????es tamb??m podem ' + 
			'ser gastas com INVESTIGA????O e DIPLOMACIA.')],
			[('Investiga????es s??o ??teis para obter informa????o crucial sobre outros jogadores. ' +
			'Para investigar algu??m, clique em seu retrato e depois em INFO.')],
			['Investigue GROLK, O ORC.', 'Investigue GROLK, O ORC, clicando em seu retrato e depois em INFO.'],
			[('Grolk confia em voc??, mas ?? poss??vel saber sua opini??o em rela????o ?? outros jogadores tamb??m. ' + 
			'Clique no retrato no lado direito do painel para mudar o outro jogador.'), ('Clique no retrato ' + 
			'no lado direito do painel para mudar o outro jogador.')],
			[('Muito bem. Ent??o, Grolk confia em voc??, mas n??o confia em Daint. Isso pode ser usado como arma... '+
			'Veremos como fazer isso a seguir.')],
			[('Cada NPC tem uma personalidade distinta, que pode ser examinada clicando no bot??o ao lado direito de INFO. '+
			'Preste aten????o especial nas se????es IRMANDADE e SIMPLES.'), ('Clique no bot??o ao lado ' + 
			'direito de INFO. Preste aten????o especial nas se????es IRMANDADE e SIMPLES.')],
			[('Grolk sempre confia em seus aliados, e fica Hostil a qualquer um que atac??-los. Com essas caracter??sticas, '+
			'?? poss??vel influenci??-lo a atacar outra pessoa.')],
			[('A mensagem que queremos passar ?? de Daint ir?? nos atacar. Para isso, utilizaremos ' + 
			'a mec??nica de Diplomacia, enviando uma carta para Grolk.')],
			['Para fazer isso, selecione as op????es desejadas na ??rea de Diplomacia de Grolk e clique Enviar.', 
			('Envie uma mensagem dizendo que Daint ir?? nos atacar. Selecione as op????es desejadas na ??rea de Diplomacia '+
			' de Grolk e clique Enviar.')],
			[('Grolk:\nAn??o traidor miser??vel! Irm??o, n??o se preocupe. Meus homens v??o matar, cortar ' +
			'e desfiar todo pequeno que verem pela frente!')],
			['Muito bem! Agora, avance o turno.', 'Avance o turno.']]
		2:
			texts = [[''],
			[('The Long Game ist ein Spiel ??ber Diplomatie und Intrigue. Seine Hauptmechanik dreht sich um den Gefangendilemma - ' +
			 'ein Gedankenexperiment mit Bezug zur Spieltheorie.')],
			[('In jeder Runde w??hlt jeder Spieler eine Haltung (Passiv/Aggressiv) gegen??ber einem anderen Spieler. ' +
			'Um eine Haltung zu ??ndern, klicke auf den Button unter dem Portr??t eines Spielers.'), ('??ndere deine Haltung, ' +
			'indem den Button unter dem Portr??t eines Spielers klicken.')],
			[('Gut. Allgemein ist die passive Haltung diplomatischer und besser f??r beide beteiligte Spieler, aber l??sst den ' +
			'Einzelne ungesch??tzt, wenn der andere Spieler ihn attackiert.')],
			[('Auf der anderen Seite, ist die agressive Haltung besser f??r den Einzelne, jedoch kostet sie eine Aktion' +
			'und erzeugt Ressentiment zwischen den Spielern.')],
			[('Das Spiel dauert 6 Runde und jeder Spieler hat 3 Aktionen pro Runde. Neben Angriff k??nnen Aktionen auch' +
			'mit NACHFORSCHUNGEN und DIPLOMATIE verbracht werden.')],
			[('Nachforschungen k??nnen entscheidende Information ??ber andere Spieler enth??llen. Um jemand nachzuforschen, ' +
			'klicke auf sein Portr??t und dann auf INFO.')],
			['Forsche GROLK, DER ORC nach.', 'Forsche GROLK, DER ORC nach, indem auf sein Portr??t und dann auf INFO klicken.'],
			[('Grolk vertraut dir, aber es ist m??glich, seine Meinung ??ber andere Spieler auch zu entdecken. ' +
			'Klicke auf das Portr??t in der rechten Seite des Bildschirms, um den anderen Spieler zu ??ndern.'), 
			('Klicke auf das Portr??t in der rechten Seite des Bildschirms, um den anderen Spieler zu ??ndern.')],
			[('Gut. Also vertraut Grolk dir, aber nicht Daint. Wir k??nnen das gebrauchen... ' +
			'Wir werden gleich sehen, wie man das tun kann.')],
			[('Jeder NPC hat eine einzigartige Pers??nlichkeit, die gepr??ft werden kann, indem den Button rechts von ' +
			'Info klicken. Pass besonders auf die BRUDERSCHAFT und SIMPEL Sektionen auf.'), ('Klicke den Button rechts von ' +
			'Info. Pass besonders auf die BRUDERSCHAFT und SIMPEL Sektionen auf.')],
			[('Grolk glaubt immer seinen Verb??ndete, und wird feindlich gegen jeden, der einen von ihnen attackiert. Mit ' +
			'diesen Eigenschaften kann man ihn beeinflussen, eine andere Person anzugreifen.')],
			[('Die Botschaft, die wir senden w??llen, ist, dass Daint uns attackieren wird. Daf??r werden wir Diplomatie ' +
			'gebrauchen, indem eine Nachricht an Grolk senden.')],
			['Um das zu tun, w??hle die angemessene Optionen im Grolks Diplomatie-Bereich und klicke Senden.', 
			('Sende eine Nachricht, die sagt, dass Daint uns attackieren wird. W??hle die angemessene Optionen im' + 
			'Grolks Diplomatie-Bereich und klicke Senden.')],
			[('Grolk:\nK??mmerlicher verr??terischer Zwerg! Bruder, mach dir keine Sorgen. Meine M??nner werden jeden ' +
			'Kleinen t??ten und abschlachten, den sie finden kann!')],
			['Gut! Jetzt beende deinen Zug.', 'Beende deinen Zug.']]


# ------------- SIGNAL STUFF -------------------------------

# Clicking on stance
func _on_SalemAI_changed_stance():
	if current_text == 2:
		advance_popup(true)

# Investigating Grolk
func _on_SalemAI_pressed_info(enemy_name):
	if enemy_name == 'Grolk':
		current_text = 7
		advance_popup(true)


func _on_SalemAI_closed_manual():
	print('closed manual ' + str(current_text))
	if current_text == 10:
		advance_popup(true)


func _on_SalemAI_pressed_opponent():
	if current_text == 8:
		advance_popup(true)


func _on_SalemAI_send_message(_character_name, package, recipient):
	if package == ['Daint',1,'Salem'] and recipient == 'Grolk':
		advance_popup(true)


func _on_SalemAI_advance_turn(_character_name):
	print(str(current_text))
	if current_text == 15:
		get_tree().change_scene("res://Mini Scenes/Scenes/Tutorial2.tscn")

func advance_turn(_char):
	pass
