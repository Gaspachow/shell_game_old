class HelpCommand
    def edit
        ret = %q(


                                                _,--=--._
                                              ,'    _    `.
                                             -    _(_)_o   -
                                        ____'    /_  _/]    `____
                                 -=====::(+):::::::::::::::::(+)::=====-
                                          (+).""""""""""""",(+)
                                              .           ,
                                                `  -=-  '
                      
        
                  ).colorize(:light_blue)
        ret += %q(                                AIDE).colorize(:light_green)
        ret += "\n                                        q pour quitter".colorize(:red)
        ret += %q(

          Tu trouveras ici des informations qui t\'aideront pendant toute l\'enquête.
          
          En première partie, tu trouveras des indications sur les étapes à effectuer pour retrouver le voleur et le diamant.
          
          En dernière partie, tu trouveras la liste des commnandes importantes que tu pourras utiliser.)
          ret += "\n\n    I / LES ETAPES\n"

          ret += "        - Aller dans le dossier #{"securite".colorize(:green)}, récupérer puis changer le mot de passe de l\'utilisateur #{"root".colorize(:green)}.\n\n"
          
          ret += "        - Aller dans le dossier #{"planetes".colorize(:green)} et envoyer un mail au analyseurs des deux planetes pour les faire revenir dans le XZ120F.\n\n"
          
          ret += "        - Aller dans le dossier #{"admin".colorize(:green)} et récupérer le mot de passe qui permettra d\'accéder à la gestion du vaisseau.\n\n"
          
          ret += "        - Accéder à la partie #{"gestion du système".colorize(:green)} avec la commande #{"admin".colorize(:green)} et faite en sorte de déteriorer les compostants du vaisseau pour enfin, le détruire.\n\n"
          ret += %Q(    II / LES COMMANDES

          Utilisation des commandes :
        
               ==================================================================
              |      commande + paramètre1 + ...(paramètre2 + paramètre3)...    |
               ==================================================================
        
          -> #{"hint".colorize(:green)} : donne des indices de ce qui devrait être fait dans ce dossier.
        
          -> #{"cat".colorize(:green)} : affiche le contenu du fichier passé en paramètre.
          
          -> #{"ls".colorize(:green)} : affiche l\'ensemble des fichiers contenus dans le dossier courant.

            * Si l\'option " -a" est donnée en paramètre, tous les fichiers du repertoire
              indiqué vont s\'afficher, ainsi que les fichiers et dossiers cachés.

          -> #{"cd".colorize(:green)} : change le dossier courant pour aller dans le
              dossier passé en paramètre.

            * Si le chemin " .." est donné en paramètre, le nouveau dossier
              sera le répertoire le répertoire précédent.

          -> #{"edit".colorize(:green)} : Permet d\'editer un fichier

        ->  #{"* Pour enregistrer, il faut faire Control + x.".colorize(:red)}

          -> #{"admin".colorize(:green)} : permet d\'acceder à l\'espace sécurisé de gestion du vaisseau.

          -> #{"rm".colorize(:green)} : supprime le fichier passé en paramètre.

          -> #{"aide".colorize(:green)} : ouvre le centre d\'aide.

          -> #{"chmod".colorize(:green)} : modifie les permissions d\'accès au fichier indiqué.

            * Utilise la commande #{"chmod +r".colorize(:green)} pour te donner les droits de lecture du fichier.

          -> #{"mail".colorize(:green)} : envoie un email au destinataire spécifié en paramètre

          -> #{"status".colorize(:green)} : donne l\'état du vaisseau (ne fonctionne que dans la partie gestion du vaisseau.)

          -> #{"destruction".colorize(:green)} : tente de détruire le vaisseau (ne fonctionne que dans la partie gestion du vaisseau.))
    end
end
