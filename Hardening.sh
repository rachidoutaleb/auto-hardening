#!/bin/bash

# Séquence d'échappement ANSI pour activer le texte en gras
GRAS="\033[1m"

# Séquence d'échappement ANSI pour désactiver le texte en gras
NORMAL="\033[0m"

# Function to display green messages
afficher_message_vert() {
    echo "${GRAS}\033[32m$1${NORMAL}"
}

# Function to display red messages
afficher_message_rouge() {
    echo "${GRAS}\033[31m$1${NORMAL}"
}

# Fonction pour afficher la bannière
afficher_banniere() { 
    echo ""
    echo "               _              _    _               _            _             ";
    echo "    /\        | |            | |  | |             | |          (_)            ";
    echo "   /  \  _   _| |_ ___ ______| |__| | __ _ _ __ __| | ___ _ __  _ _ __   __ _ ";
    echo "  / /\ \| | | | __/ _ \______|  __  |/ _  | '__/ _  |/ _ \ '_ \| | '_ \ / _  |";
    echo " / ____ \ |_| | || (_) |     | |  | | (_| | | | (_| |  __/ | | | | | | | (_| |";
    echo "/_/    \_\__,_|\__\___/      |_|  |_|\__,_|_|  \__,_|\___|_| |_|_|_| |_|\__, |";
    echo "                                                                         __/ |";
    echo "                                                                        |___/ ";
}



afficher_menu_configuration_systeme() {
    echo "${GRAS}\033[34mSelect the configuration you wish to perform:${NORMAL}"
    echo "1. Hardware configuration"
    echo "2. kernel configuration"
    echo "3. System configuration"
    echo "4. Service configuration"
    echo "5. Exit"
}

# Function to display recommendation options
afficher_options_recommandation() {
    echo " "
    echo "${GRAS}\033[34mRecommendation options:${NORMAL}"
    echo "1. Minimal level recommendation"
    echo "2. Intermediate level recommendation"
    echo "3. Enhanced level recommendation"
    echo "4. High level recommendation"
    echo "5. Return to main menu"
}


afficher_banniere


if [ "$(id -u)" -eq 0 ]; then
	echo "The user has root privileges. Execution allowed."
	echo "Welcome! Here is the list of possible configurations you have completed:"
else
    echo "Error: You do not have root privileges. Execution is prohibited."

    exit 1
fi


while true; do
    afficher_menu_configuration_systeme

    read -p "Entrez le numéro de votre choix : " choix_recommandation

    case $choix_recommandation in
        1)
            afficher_options_recommandation
            read -p "Entrez le numéro de votre choix pour la configuration matérielle : " choix_materiel
            case $choix_materiel in
                1)
                    ./materiel/configurer-materiel-minimal
                    break
                    ;;
                2)
                    ./materiel/configurer-materiel-intermédiaire
                    break
                    ;;
                3)
                    ./materiel/configurer-materiel-renforcee
                    break
                    ;;
                4)
                    ./materiel/configurer-materiel-elevee
                    break
                    ;;
                
                5)
                    afficher_message_vert "Returning to main menu..."
                    echo ""
		    continue
		    ;;
                
                *)
                    afficher_message_rouge "Choix invalide pour la configuration matérielle."
                    ;;
            esac
            ;;
        2)
            afficher_options_recommandation
            read -p "Entrez le numéro de votre choix pour la configuration du noyau Linux : " choix_noyau_linux
            case $choix_noyau_linux in
                1)
                    ./noyau/configurer-noyau-minimal
                    break
                    ;;
                2)
                    ./noyau/configurer-noyau-intermédiaire
                    break
                    ;;
                3)
                    ./noyau/configurer-noyau-renforcee
                    break
                    ;;
                4)
                    ./noyau/configurer-noyau-elevee
                    break
                    ;;
                5)
                    afficher_message_vert "Returning to main menu..."
                    echo ""
		    continue
		    ;;
                *)
                    afficher_message_rouge "Choix invalide pour la configuration du noyau Linux."
                    ;;
            esac
            ;;
        3)
            afficher_options_recommandation
            read -p "Entrez le numéro de votre choix pour la configuration système : " choix_systeme
            case $choix_systeme in
                1)
                    ./system/configurer-system-minimal
                    break
                    ;;
                2)
                    ./system/configurer-system-intermédiaire
                    break
                    ;;
                3)
                    ./system/configurer-system-renforcee
                    break
                    ;;
                4)
                    ./system/configurer-system-elevee
                    break
                    ;;
                5)
                    afficher_message_vert "Returning to main menu..."
                    echo ""
		    continue
		    ;;
                *)
                    afficher_message_rouge "Choix invalide pour la configuration système."
                    ;;
            esac
            ;;
        4)
            afficher_options_recommandation
            read -p "Entrez le numéro de votre choix pour la configuration des services : " choix_services
            case $choix_services in
                1)
                    ./service/configurer-service-minimal
                    break
                    ;;
                2)
                    ./service/configurer-service-intermédiaire
                    break
                    ;;
                3)
                    ./service/configurer-service-renforcee
                    break
                    ;;
                4)
                    ./service/configurer-service-elevee
                    break
                    ;;
                5)
                    afficher_message_vert "Returning to main menu..."
                    echo ""
		    continue
		    ;;
                *)
                    afficher_message_rouge "Choix invalide pour la configuration des services."
                    ;;
            esac
            ;;
        5)
            afficher_message_vert "BYE BYE"
            break
            ;;
        *)
            afficher_message_rouge "Choix invalide. Veuillez entrer un numéro valide."
            echo " "
            echo " "
            ;;
    esac
done
