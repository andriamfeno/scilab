// ==============================================
// Projet : Interface Image - DOGBE Koami Emmanuel
// =============================================

// Charger le module IPCV 
atomsLoad("IPCV");

// Variable globale pour stocker l'image
global img;
global nom_fichier; 
global langue_actuelle;
langue_actuelle = "fr";


// Créer la fenêtre principale avec plus d'espace
f = figure("Position", [100, 100, 1200, 600], ...
           "Figure_name", "Outils libre -  Projet", ...
           "BackgroundColor", [0.2 0.8 0.95]);
        




global bouton_actif;
bouton_actif = []; // vide au début

// Zone pour afficher l'image 
// Cadre noir (bordure)
cadre_noir = uicontrol(f, "Style", "frame", ...
                       "Position", [75, 175, 710, 455], ...
                       "BackgroundColor", [0 0 0]);

// Cadre gris clair au-dessus (zone d’affichage)
axes_handle = uicontrol(f, "Style", "frame", ...
                        "Position", [80, 180, 700, 445], ...
                        "BackgroundColor", [0.8 0.8 0.8]);

                        
// Créer un fond (cadre) légèrement plus grand derrière le texte
uicontrol(f, "Style", "text", ...
          "String", "", ...
          "Position", [295, 645, 610, 50], ...  
          "BackgroundColor", [0.8 0.8 0.9], ... 
          "ForegroundColor", [0 0 0], ...
          "FontSize", 16, ...
          "HorizontalAlignment", "center", ...
          "FontWeight", "bold");
          
// Texte au centre du cadre
texte_cadre = uicontrol(f, "Style", "text", ...
                        "String", "Aucune image importée", ...
                        "Position", [80, 370, 700, 60], ...  // centré verticalement
                        "BackgroundColor", [0.8 0.8 0.8], ...
                        "FontSize", 16, ...
                        "FontWeight", "bold", ...
                        "HorizontalAlignment", "center", ...
                        "ForegroundColor", [0 0 0]);

// Titre principal (initialement en français)
titre_projet = uicontrol(f, "Style", "text", ...
          "String", "Projet  Traitement d image SCIlab - M1 IBD", ...
          "Position", [300, 650, 600, 40], ...
          "BackgroundColor", [0.2 0.8 0.95], ...
          "FontSize", 16, ...
          "FontWeight", "bold", ...
          "ForegroundColor", [0 0 0.4], ...
          "HorizontalAlignment", "center");

          
bouton_import = uicontrol(f, "Style", "pushbutton", ...
         "String", "Importer une image", ...
         "FontSize", 16, ...
         "FontWeight", "bold", ...
         "BackgroundColor", [0 0.65 0], ...
         "ForegroundColor", [1 1 1], ...
         "Position", [50, 10, 200, 80], ...
         "Callback", "import_image()");

         
bouton_reset = uicontrol(f, "Style", "pushbutton", ...
         "String", "Réinitialiser l''image", ...
         "FontSize", 16, ...
         "FontWeight", "bold", ...
         "BackgroundColor", [0 0 0], ...
         "ForegroundColor", [1 1 1], ...
         "Position", [410, 120, 200, 40], ...
         "Callback", "reset_image()");


bouton_sauvegarder = uicontrol(f, "Style", "pushbutton", ...
         "String", "Sauvegarder", ...
         "FontSize", 16, ...
         "FontWeight", "bold", ...
         "BackgroundColor", [1 0.85 0.2], ...
         "ForegroundColor", [0 0 0], ...
         "Position", [400, 10, 200, 80], ...
         "Callback", "sauvegarder_image()");

         
bouton_metadonnees = uicontrol(f, "Style", "pushbutton", ...
    "String", "Métadonnées", ...
    "FontSize", 16, ...
    "FontWeight", "bold", ...
    "BackgroundColor", [0.1 0.1 0.3], ...
    "ForegroundColor", [1 1 1], ...
    "Position", [60, 100, 190, 40], ...
    "Callback", "afficher_metadonnees()");


//Bouton quitter
bouton_quitter = uicontrol(f, "Style", "pushbutton", ...
         "String", "Quitter", ...
         "FontSize", 16, ...
         "FontWeight", "bold", ...
         "BackgroundColor", [0.9 0.1 0.1], ...
         "ForegroundColor", [1 1 1], ...
         "Position", [750, 10, 200, 80], ...
         "Callback", "quitter_application()");

//Bouton image noir et blanc
bouton_nb = uicontrol(f, ...
         "Style", "pushbutton", ...
         "String", "Image en noir et blanc", ...
         "Position", [1000, 610, 180, 30], ...
         "BackgroundColor", [0.1 0.1 0.3], ...
         "ForegroundColor", [1 1 1], ...
         "FontSize", 12, ...
         "Callback", "convertir_nb()");

//Bouton : image en rouge         
bouton_rouge = uicontrol(f, ...
         "Style", "pushbutton", ...
         "String", "Image en rouge", ...
         "Position", [1185, 610, 180, 30], ...
         "BackgroundColor", [0.1 0.1 0.3], ...
         "ForegroundColor", [1 1 1], ...
         "FontSize", 12, ...
         "Callback", "convertir_rouge()");

//Bouton VConvertir en bleu         
bouton_bleu = uicontrol(f, ...
         "Style", "pushbutton", ...
         "String", "Image en bleu", ...
         "Position", [1370, 610, 180, 30], ...
         "BackgroundColor", [0.1 0.1 0.3], ...
         "ForegroundColor", [1 1 1], ...
         "FontSize", 12, ...
         "Callback", "convertir_bleu()");

//Bouton convertir vert         
bouton_vert = uicontrol(f, ...
         "Style", "pushbutton", ...
         "String", "Image en vert", ...
         "Position", [1000, 570, 180, 30], ...
         "BackgroundColor", [0.1 0.1 0.3], ...
         "ForegroundColor", [1 1 1], ...
         "FontSize", 12, ...
         "Callback", "convertir_vert()");

         
// Bouton : Image négatif
bouton_negatif = uicontrol(f, ...
         "Style", "pushbutton", ...
         "String", "Image négatif", ...
         "Position", [1185, 570, 180, 30], ...
         "BackgroundColor", [0.1 0.1 0.3], ...
         "ForegroundColor", [1 1 1], ...
         "FontSize", 12, ...
         "Callback", "image_negatif()");

         
//Bouton Mode Mirror
bouton_miroir = uicontrol(f, ...
         "Style", "pushbutton", ...
         "String", "Mode Mirror", ...
         "Position", [1370, 570, 180, 30], ...
         "BackgroundColor", [0.1 0.1 0.3], ...
         "ForegroundColor", [1 1 1], ...
         "FontSize", 12, ...
         "Callback", "rotation_horizontale()");

         
bouton_rotation_180 = uicontrol(f, ...
         "Style", "pushbutton", ...
         "String", "Rotation 180°", ...
         "Position", [1000, 510, 180, 30], ...
         "BackgroundColor", [0.1 0.1 0.3], ...
         "ForegroundColor", [1 1 1], ...
         "FontSize", 12, ...
         "Callback", "rotation_180()");

         
         
// Bouton : Cisaillement
bouton_cisaillement = uicontrol(f, ...
         "Style", "pushbutton", ...
         "String", "Cisaillement", ...
         "Position", [1000, 470, 180, 30], ...
         "BackgroundColor", [0.1 0.1 0.3], ...
         "ForegroundColor", [1 1 1], ...
         "FontSize", 12, ...
         "Callback", "shear_image()");

         
// Bouton : Découper l'image (à côté du bouton Cisaillement)
bouton_decoupage = uicontrol(f, ...
         "Style", "pushbutton", ...
         "String", "Découpage", ...
         "Position", [1190, 470, 180, 30], ...
         "BackgroundColor", [0.1 0.1 0.3], ...
         "ForegroundColor", [1 1 1], ...
         "FontSize", 12, ...
         "Callback", "decouper_image_vertical()");

 
//Bouton cachée         
bouton_image_cachee = uicontrol(f, ...
         "Style", "pushbutton", ...
         "String", "Image cachée", ...
         "Position", [1375, 470, 180, 30], ...
         "BackgroundColor", [0.1 0.1 0.3], ...
         "ForegroundColor", [1 1 1], ...
         "FontSize", 12, ...
         "Callback", "circle()");


// Bouton : Rotation 90° 
bouton_rotation_90 = uicontrol(f, ...
         "Style", "pushbutton", ...
         "String", "Rotation 90°", ...
         "Position", [1190, 510, 175, 30], ...
         "BackgroundColor", [0.1 0.1 0.3], ...
         "ForegroundColor", [1 1 1], ...
         "FontSize", 12, ...
         "Callback", "rotation_90()");

         
// Bouton : Zoom X2
bouton_zoom_x2 = uicontrol(f, ...
         "Style", "pushbutton", ...
         "String", "Zoom X2", ...
         "Position", [1370, 510, 180, 30], ...
         "BackgroundColor", [0.1 0.1 0.3], ...
         "ForegroundColor", [1 1 1], ...
         "FontSize", 12, ...
         "Callback", "zoom_x2()");

         
// Bouton : Afficher l'histogramme (gris)
bouton_histo_gris = uicontrol(f, ...
         "Style", "pushbutton", ...
         "String", "Histogramme niveau gris", ...
         "Position", [1000, 400, 180, 30], ...
         "BackgroundColor", [0.1 0.1 0.3], ...
         "ForegroundColor", [1 1 1], ...
         "FontSize", 12, ...
         "Callback", "histo_gris();");

         
// Bouton : Afficher l'histogramme (rouge)
bouton_histo_rouge = uicontrol(f, ...
         "Style", "pushbutton", ...
         "String", "Histogramme niveau rouge", ...
         "Position", [1190, 400, 180, 30], ...
         "BackgroundColor", [0.1 0.1 0.3], ...
         "ForegroundColor", [1 1 1], ...
         "FontSize", 12, ...
         "Callback", "histo_rouge();");

         
// Bouton : Afficher l'histogramme (bleu)
bouton_histo_bleu = uicontrol(f, ...
         "Style", "pushbutton", ...
         "String", "Histogramme niveau bleu", ...
         "Position", [1375, 400, 180, 30], ...
         "BackgroundColor", [0.1 0.1 0.3], ...
         "ForegroundColor", [1 1 1], ...
         "FontSize", 12, ...
         "Callback", "histo_bleu();");

         
// Bouton : Afficher l'histogramme (vert)
bouton_histo_vert = uicontrol(f, ...
         "Style", "pushbutton", ...
         "String", "Histogramme niveau vert", ...
         "Position", [1000, 360, 180, 30], ...
         "BackgroundColor", [0.1 0.1 0.3], ...
         "ForegroundColor", [1 1 1], ...
         "FontSize", 12, ...
         "Callback", "histo_vert();");

         
 // Bouton : Afficher l'histogramme (cumuklé)
bouton_histo_cumule = uicontrol(f, ...
         "Style", "pushbutton", ...
         "String", "Histogramme cumulé", ...
         "Position", [1190, 360, 180, 30], ...
         "BackgroundColor", [0.1 0.1 0.3], ...
         "ForegroundColor", [1 1 1], ...
         "FontSize", 12, ...
         "Callback", "histo_cumule();");
         
 // Bouton : Afficher l'histogramme (normalisé)
bouton_histo_normalise = uicontrol(f, ...
         "Style", "pushbutton", ...
         "String", "Histogramme normalisé", ...
         "Position", [1375, 360, 180, 30], ...
         "BackgroundColor", [0.1 0.1 0.3], ...
         "ForegroundColor", [1 1 1], ...
         "FontSize", 12, ...
         "Callback", "histo_normalise();");

         
 // Bouton : Afficher l'histogramme (lumincence)
bouton_histo_luminance = uicontrol(f, ...
         "Style", "pushbutton", ...
         "String", "Histogramme luminance", ...
         "Position", [1000, 322, 180, 30], ...
         "BackgroundColor", [0.1 0.1 0.3], ...
         "ForegroundColor", [1 1 1], ...
         "FontSize", 12, ...
         "Callback", "histo_luminance();");

         
 // Bouton : Afficher l'histogramme (contraste)
bouton_histo_contraste = uicontrol(f, ...
         "Style", "pushbutton", ...
         "String", "Histogramme contraste", ...
         "Position", [1190, 322, 180, 30], ...
         "BackgroundColor", [0.1 0.1 0.3], ...
         "ForegroundColor", [1 1 1], ...
         "FontSize", 12, ...
         "Callback", "histo_contraste();");

         
// Bouton : Afficher passe bas
bouton_passe_bas = uicontrol(f, ...
         "Style", "pushbutton", ...
         "String", "Passe bas (floue)", ...
         "Position", [1000, 260, 180, 30], ...
         "BackgroundColor", [0.1 0.1 0.3], ...
         "ForegroundColor", [1 1 1], ...
         "FontSize", 12, ...
         "Callback", "filtrage_passe_bas();");

         
// Bouton : Afficher passe haut
bouton_passe_haut = uicontrol(f, ...
         "Style", "pushbutton", ...
         "String", "Passe haut (contours)", ...
         "Position", [1190, 260, 180, 30], ...
         "BackgroundColor", [0.1 0.1 0.3], ...
         "ForegroundColor", [1 1 1], ...
         "FontSize", 12, ...
         "Callback", "filtrage_passe_haut();");

         
// Bouton : Afficher passe bande
bouton_passe_bande = uicontrol(f, ...
         "Style", "pushbutton", ...
         "String", "Passe bande", ...
         "Position", [1380, 260, 180, 30], ...
         "BackgroundColor", [0.1 0.1 0.3], ...
         "ForegroundColor", [1 1 1], ...
         "FontSize", 12, ...
         "Callback", "filtrage_passe_bande();");

//Filtrage median         
bouton_filtre_median = uicontrol(f, ...
    "Style", "pushbutton", ...
    "String", "Filtre Médian", ...
    "Position", [1000, 220, 180, 30], ...
    "BackgroundColor", [0.1 0.1 0.3], ...
    "ForegroundColor", [1 1 1], ...
    "FontSize", 12, ...
    "Callback", "filtrage_median()");
 

bouton_filtre_gaussien = uicontrol(f, ...
    "Style", "pushbutton", ...
    "String", "Filtre Gaussien", ...
    "Position", [1190, 220, 180, 30], ...
    "BackgroundColor", [0.1 0.1 0.3], ...
    "ForegroundColor", [1 1 1], ...
    "FontSize", 12, ...
    "Callback", "filtrage_gaussien()");


bouton_filtre_moyenneur = uicontrol(f, ...
    "Style", "pushbutton", ...
    "String", "Filtre Moyenneur + Bruit", ...
    "Position", [1380, 220, 180, 30], ...
    "BackgroundColor", [0.1 0.1 0.3], ...
    "ForegroundColor", [1 1 1], ...
    "FontSize", 12, ...
    "Callback", "filtrage_moyenneur()");
           
         
bouton_seuillage_global = uicontrol(f, ...
    "Style", "pushbutton", ...
    "String", "Seuillage Global", ...
    "Position", [1000, 160, 180, 30], ...
    "BackgroundColor", [0.1 0.1 0.3], ...
    "ForegroundColor", [1 1 1], ...
    "FontSize", 12, ...
    "Callback", "seuillage_global()");

            
bouton_gradient_seuille = uicontrol(f, ...
    "Style", "pushbutton", ...
    "String", "Gradient seuillé", ...
    "Position", [1380, 160, 180, 30], ...
    "BackgroundColor", [0.1 0.1 0.3], ...
    "ForegroundColor", [1 1 1], ...
    "FontSize", 12, ...
    "Callback", "gradient_seuille()");


bouton_laplacien = uicontrol(f, ...
    "Style", "pushbutton", ...
    "String", "Calcul laplacien", ...
    "Position", [1190, 160, 180, 30], ...
    "BackgroundColor", [0.1 0.1 0.3], ...
    "ForegroundColor", [1 1 1], ...
    "FontSize", 12, ...
    "Callback", "calcul_laplacien()");
     

bouton_seuillage_auto = uicontrol(f, ...
    "Style", "pushbutton", ...
    "String", "Seuillage automatique", ...
    "Position", [1000, 120, 180, 30], ...
    "BackgroundColor", [0.1 0.1 0.3], ...
    "ForegroundColor", [1 1 1], ...
    "FontSize", 12, ...
    "Callback", "seuillage_otsu()");
 

//Additionner les images 
bouton_addition_nb = uicontrol(f, ...
    "Style", "pushbutton", ...
    "String", "Additionner avec NB", ...
    "Position", [1000, 60, 180, 30], ...
    "BackgroundColor", [0.1 0.1 0.3], ...
    "ForegroundColor", [1 1 1], ...
    "FontSize", 12, ...
    "Callback", "addition_image_nb()");
 

bouton_soustraction_nb = uicontrol(f, ...
    "Style", "pushbutton", ...
    "String", "Soustraire avec NB", ...
    "Position", [1000, 20, 180, 30], ...
    "BackgroundColor", [0.1 0.1 0.3], ...
    "ForegroundColor", [1 1 1], ...
    "FontSize", 12, ...
    "Callback", "soustraction_image_nb()");


//Soustaction laplacien
bouton_soustraction_laplacien = uicontrol(f, ...
    "Style", "pushbutton", ...
    "String", "Soustraire avec Laplacien", ...
    "Position", [1190, 20, 180, 30], ...
    "BackgroundColor", [0.1 0.1 0.3], ...
    "ForegroundColor", [1 1 1], ...
    "FontSize", 12, ...
    "Callback", "soustraction_image_laplacien()");

//Bouton multiplier rouge                    
bouton_multiplication_rouge = uicontrol(f, ...
    "Style", "pushbutton", ...
    "String", "Multiplier avec image (R)", ...
    "Position", [1190, 60, 180, 30], ...
    "BackgroundColor", [0.1 0.1 0.3], ...
    "ForegroundColor", [1 1 1], ...
    "FontSize", 12, ...
    "Callback", "multiplication_image_rouge()");
 
//Bouton passe bas negatif                   
bouton_passe_bas_negatif = uicontrol(f, ...
    "Style", "pushbutton", ...
    "String", "passe bas + neg", ...
    "Position", [1390, 60, 180, 30], ...
    "BackgroundColor", [0.1 0.1 0.3], ...
    "ForegroundColor", [1 1 1], ...
    "FontSize", 12, ...
    "Callback", "addition_negative_floue()");

//Bouton neg
bouton_mult_negatif = uicontrol(f, ...
    "Style", "pushbutton", ...
    "String", "Multiplier Négatif", ...
    "Position", [1390, 20, 180, 30], ...
    "BackgroundColor", [0.1 0.1 0.3], ...
    "ForegroundColor", [1 1 1], ...
    "FontSize", 12, ...
    "Callback", "mult_negatif()");


// Texte : Paramètres centré avec tirets, aligné à la colonne du bouton noir et blanc
texte_parametres = uicontrol(f, ...
    "Style", "text", ...
    "String", "───────   PARAMÈTRES   ───────", ...
    "Position", [1000, 660, 400, 40], ...
    "BackgroundColor", [0.2 0.8 0.95], ...
    "ForegroundColor", [0 0 0.4], ...
    "FontSize", 16, ...
    "FontWeight", "bold", ...
    "HorizontalAlignment", "center", ...
    "FontName", "Arial");

         
// Texte : Sous-titre "LES COULEURS"
texte_palette = uicontrol(f, ...
         "Style", "text", ...
         "String", "PALETTE DE COULEURS", ...
         "Position", [1000, 650, 400, 20], ...
         "BackgroundColor", [0.2 0.8 0.95], ...
         "ForegroundColor", [0 0 0], ...
         "FontSize", 14, ...
         "FontWeight", "bold", ...
         "HorizontalAlignment", "center");

         
// Texte : Sous-titre "Géométriques"
texte_transformations = uicontrol(f, ...
         "Style", "text", ...
         "String", " TRANSFORMATIONS GEOMETRIQUES", ...
         "Position", [1050, 540, 400, 20], ...
         "BackgroundColor", [0.2 0.8 0.95], ...
         "ForegroundColor", [0 0 0], ...
         "FontSize", 14, ...
         "FontWeight", "bold", ...
         "HorizontalAlignment", "center");


//Texte : Sous titre  : Histogramme         
texte_histogramme = uicontrol(f, ...
         "Style", "text", ...
         "String", " HISTOGRAMME", ...
         "Position", [980, 440, 400, 20], ...
         "BackgroundColor", [0.2 0.8 0.95], ...
         "ForegroundColor", [0 0 0], ...
         "FontSize", 14, ...
         "FontWeight", "bold", ...
         "HorizontalAlignment", "center");

 
 // Texte : Sous-titre "Filtrage"         
texte_filtrage = uicontrol(f, ...
         "Style", "text", ...
         "String", " FILTRAGE", ...
         "Position", [980, 290, 400, 20], ...
         "BackgroundColor", [0.2 0.8 0.95], ...
         "ForegroundColor", [0 0 0], ...
         "FontSize", 14, ...
         "FontWeight", "bold", ...
         "HorizontalAlignment", "center");

         
 // Texte : Sous-titre "Seuillage"
texte_seuillage = uicontrol(f, ...
         "Style", "text", ...
         "String", " SEUILLAGE", ...
         "Position", [980, 190, 400, 20], ...
         "BackgroundColor", [0.2 0.8 0.95], ...
         "ForegroundColor", [0 0 0], ...
         "FontSize", 14, ...
         "FontWeight", "bold", ...
         "HorizontalAlignment", "center");

         
//Texte : Sous titre :operation
texte_operations = uicontrol(f, ...
         "Style", "text", ...
         "String", " OPERATIONS", ...
         "Position", [980, 90, 430, 20], ...
         "BackgroundColor", [0.2 0.8 0.95], ...
         "ForegroundColor", [0 0 0], ...
         "FontSize", 14, ...
         "FontWeight", "bold", ...
         "HorizontalAlignment", "center");


// ===========================
// === Fonctions associées ===
// ===========================

// Fonction : Importer l'image
function import_image()
    global img;
    global axes_handle;
    global nom_fichier; // 
    
    [file, path] = uigetfile([".png"; ".jpg"; ".jpeg"; ".bmp"; ".tif"], "Choisir une image");
    if file <> "" then
        img = imread(path + "/" + file);
        nom_fichier = file; 
        
        // Effacer l'ancienne image si elle existe
        delete(axes_handle);
        delete(cadre_noir);
        delete(texte_cadre);
        
        // Créer un nouvel axes pour afficher l'image
        axes_handle = gca();
        axes_handle.axes_bounds = [0.1, 0.1, 0.5, 0.7]; // Position relative [x, y, largeur, hauteur]
        
        // Afficher l'image
        imshow(img);
        title("Image importée : " + file, "fontsize", 3);
        
        // Remettre la fenêtre principale au premier plan
        figure(f);
    else
        messagebox("Aucune image sélectionnée.", "Information");
    end
endfunction

function reset_image()
    global img;
    global axes_handle;
    global f;

    // 🔴 Trouver le bouton par son texte
    h = findobj("String", "Réinitialiser l''image");
    if h <> [] then
        // Changer en rouge foncé
        h.BackgroundColor = [0.5 0 0];

        // ⏳ Revenir au noir après 3 secondes
        sleep(500); // 3000 ms = 3 secondes 
        h.BackgroundColor = [0 0 0];
    end

    if img <> [] then
        try
            delete(axes_handle)
        catch
        end

        axes_handle = gca();
        axes_handle.axes_bounds = [0.1, 0.1, 0.5, 0.7];
        imshow(img);
        title("Image importée", "fontsize", 3);
        figure(f);
    else
        messagebox("Aucune image à réinitialiser.", "Information");
    end
endfunction

// --- Fonction : Image en Noir et Blanc ---
function convertir_nb()
    global img;
    global bouton_actif;
    
    if typeof(img) <> "constant" then
        // 1. Convertir l'image
        img_nb = rgb2gray(img);
        imshow(img_nb);
        title("Image en noir et blanc", "fontsize", 3);
        
        // 2. Si un bouton était déjà violet, le remettre en bleu
        if bouton_actif <> [] then
            set(bouton_actif, "BackgroundColor", [0.1 0.1 0.3]);
        end
        
        // 3. Mettre le nouveau bouton en violet et le sauvegarder
        h = gcbo();
        set(h, "BackgroundColor", [0.5 0 0.5]);
        bouton_actif = h;
        
    else
        messagebox("Aucune image importée.", "Information");
    end
endfunction

// --- Fonction : Image en rouge ---
function convertir_rouge()
    global img;
    global bouton_actif;
    
    if typeof(img) <> "constant" then
        // 1. Convertir l'image
        img_rouge = img;
        img_rouge(:,:,2) = 0;
        img_rouge(:,:,3) = 0;
        imshow(img_rouge);
        title("Image en rouge", "fontsize", 3);
        
        // 2. Si un bouton était déjà violet, le remettre en bleu
        if bouton_actif <> [] then
            set(bouton_actif, "BackgroundColor", [0.1 0.1 0.3]);
        end
        
        // 3. Mettre le nouveau bouton en violet et le sauvegarder
        h = gcbo();
        set(h, "BackgroundColor", [0.5 0 0.5]);
        bouton_actif = h;
        
    else
        messagebox("Aucune image importée.", "Information");
    end
endfunction


// Fonction : Image en bleu
function convertir_bleu()
    global img;
    global axes_handle;
    global bouton_actif; // AJOUTÉ : déclarer la variable globale
    
    if typeof(img) <> "constant" then
        // Garder seulement le canal bleu
        img_bleu = img;
        img_bleu(:,:,1) = 0; // Supprimer le rouge
        img_bleu(:,:,2) = 0; // Supprimer le vert
        
        // Afficher l'image en bleu
        imshow(img_bleu);
        title("Image en bleu", "fontsize", 3);

        // AJOUTÉ : Remettre l'ancien bouton violet en bleu
        if bouton_actif <> [] then
            set(bouton_actif, "BackgroundColor", [0.1 0.1 0.3]);
        end
        
        // AJOUTÉ : Mettre le nouveau bouton en violet et le sauvegarder
        h = gcbo();
        set(h, "BackgroundColor", [0.5 0 0.5]);
        bouton_actif = h;
        
    else
        messagebox("Aucune image importée.", "Information");
    end
endfunction

// Fonction : Image en vert
function convertir_vert()
    global img;
    global axes_handle;
    global bouton_actif; // AJOUTÉ : déclarer la variable globale
    
    if typeof(img) <> "constant" then
        // Garder seulement le canal vert
        img_vert = img;
        img_vert(:,:,1) = 0; // Supprimer le rouge
        img_vert(:,:,3) = 0; // Supprimer le bleu
        
        // Afficher l'image en vert
        imshow(img_vert);
        title("Image en vert", "fontsize", 3);

        // AJOUTÉ : Remettre l'ancien bouton violet en bleu
        if bouton_actif <> [] then
            set(bouton_actif, "BackgroundColor", [0.1 0.1 0.3]);
        end
        
        // AJOUTÉ : Mettre le nouveau bouton en violet et le sauvegarder
        h = gcbo();
        set(h, "BackgroundColor", [0.5 0 0.5]);
        bouton_actif = h;
        
    else
        messagebox("Aucune image importée.", "Information");
    end
endfunction


// Fonction : Image négatif
function image_negatif()
    global img;
    global bouton_actif; // AJOUTÉ : déclarer la variable globale
    
    if typeof(img) <> "constant" then
        img_neg = 255 - img; // Inversion des couleurs
        imshow(img_neg);
        title("Image en négatif", "fontsize", 3);

        // AJOUTÉ : Remettre l'ancien bouton violet en bleu
        if bouton_actif <> [] then
            set(bouton_actif, "BackgroundColor", [0.1 0.1 0.3]);
        end
        
        // AJOUTÉ : Mettre le nouveau bouton en violet et le sauvegarder
        h = gcbo();
        set(h, "BackgroundColor", [0.5 0 0.5]);
        bouton_actif = h;
        
    else
        messagebox("Aucune image importée.", "Information");
    end
endfunction

// Fonction : Mode Mirror (miroir horizontal)
function rotation_horizontale()
    global img;
    global axes_handle;
    global bouton_actif; // AJOUTÉ
    
    if typeof(img) <> "constant" then
        // Effet miroir horizontal (inversion gauche-droite)
        img_mirror = flipdim(img, 2);
        
        // Afficher l'image miroir
        imshow(img_mirror);
        title("Mode Mirror (miroir horizontal)", "fontsize", 3);

        // AJOUTÉ : Gestion du bouton violet
        if bouton_actif <> [] then
            set(bouton_actif, "BackgroundColor", [0.1 0.1 0.3]);
        end
        h = gcbo();
        set(h, "BackgroundColor", [0.5 0 0.5]);
        bouton_actif = h;
        
    else
        messagebox("Aucune image importée.", "Information");
    end
endfunction


// Fonction : Rotation 180°
function rotation_180()
    global img;
    global axes_handle;
    global bouton_actif; // AJOUTÉ
    
    if typeof(img) <> "constant" then
        // Rotation de 180 degrés
        img_rotate = flipdim(flipdim(img, 1), 2); // flip vertical puis horizontal

        // Afficher l'image rotationnée
        imshow(img_rotate);
        title("Image rotationnée de 180°", "fontsize", 3);

        // AJOUTÉ : Gestion du bouton violet
        if bouton_actif <> [] then
            set(bouton_actif, "BackgroundColor", [0.1 0.1 0.3]);
        end
        h = gcbo();
        set(h, "BackgroundColor", [0.5 0 0.5]);
        bouton_actif = h;
        
    else
        messagebox("Aucune image importée.", "Information");
    end
endfunction

function rotation_90()
    global img;
    global axes_handle;
    global bouton_actif; // AJOUTÉ
    
    if typeof(img) <> "constant" then
        // Rotation de 90 degrés
        img_rotate = permute(flipdim(img, 1), [2 1 3]);

        // Afficher l'image rotationnée
        imshow(img_rotate);
        title("Image rotationnée de 90°", "fontsize", 3);

        // AJOUTÉ : Gestion du bouton violet
        if bouton_actif <> [] then
            set(bouton_actif, "BackgroundColor", [0.1 0.1 0.3]);
        end
        h = gcbo();
        set(h, "BackgroundColor", [0.5 0 0.5]);
        bouton_actif = h;
        
    else
        messagebox("Aucune image importée.", "Information");
    end
endfunction
function zoom_x2()
    global img;
    global bouton_actif; // AJOUTÉ
    
    if typeof(img) <> "constant" then
        [h, w, c] = size(img);
        facteur = 2; // zoom x2
        largeur_vue = w;
        hauteur_vue = h;
        x_centre = floor(w/2);
        y_centre = floor(h/2);

        hw = floor(largeur_vue / (2*facteur));
        hh = floor(hauteur_vue / (2*facteur));

        x1 = max(1, x_centre - hw);
        x2 = min(w, x_centre + hw);
        y1 = max(1, y_centre - hh);
        y2 = min(h, y_centre + hh);

        img_crop = img(y1:y2, x1:x2, :);
        img_zoom = imresize(img_crop, [hauteur_vue, largeur_vue]);

        imshow(img_zoom);
        title("Zoom sur l''image", "fontsize", 3);

        // AJOUTÉ : Gestion du bouton violet
        if bouton_actif <> [] then
            set(bouton_actif, "BackgroundColor", [0.1 0.1 0.3]);
        end
        h = gcbo();
        set(h, "BackgroundColor", [0.5 0 0.5]);
        bouton_actif = h;
        
    else
        messagebox("Aucune image importée.", "Information");
    end
endfunction

function shear_image()
    global img;
    global bouton_actif; // AJOUTÉ : déclarer la variable globale
    
    if typeof(img) <> "constant" then
        shx = 0.5; // cisaillement horizontal
        shy = 0.0; // cisaillement vertical

        T = [1 shx 0; shy 1 0; 0 0 1]; // matrice affine

        // Appliquer le cisaillement (type "affine" requis)
        img_shear = imtransform(img, T, "affine");

        imshow(img_shear);
        title("Cisaillement horizontal", "fontsize", 3);

        // AJOUTÉ : Remettre l'ancien bouton violet en bleu
        if bouton_actif <> [] then
            set(bouton_actif, "BackgroundColor", [0.1 0.1 0.3]);
        end
        
        // AJOUTÉ : Mettre le nouveau bouton en violet et le sauvegarder
        h = gcbo();
        set(h, "BackgroundColor", [0.5 0 0.5]);
        bouton_actif = h;
        
    else
        messagebox("Aucune image importée.", "Information");
    end
endfunction

function decouper_image_vertical()
    global img, axes_handle;
    global bouton_actif; // AJOUTÉ : déclarer la variable globale

    if typeof(img) <> "constant" then
        [h, w, c] = size(img); // hauteur, largeur, canaux

        // Découpage vertical : gauche et droite
        x_mid = floor(w/2);
        part2 = img(:, x_mid+1:$, :);     // partie droite

        // Affichage des deux parties dans le cadre
        if typeof(axes_handle) <> "constant" then
            delete(axes_handle);
        end

        // Partie droite
        axes_handle2 = gca();
        axes_handle2.axes_bounds = [0.55, 0.55, 0.35, 0.4];
        imshow(part2);
        title("Partie droite", "fontsize", 3);
        title("Image découper à droite", "fontsize", 3);

        // AJOUTÉ : Remettre l'ancien bouton violet en bleu
        if bouton_actif <> [] then
            set(bouton_actif, "BackgroundColor", [0.1 0.1 0.3]);
        end
        
        // AJOUTÉ : Mettre le nouveau bouton en violet et le sauvegarder
        h = gcbo();
        set(h, "BackgroundColor", [0.5 0 0.5]);
        bouton_actif = h;

    else
        messagebox("Aucune image importée.");
    end
endfunction


function circle()
    global img axes;
    global bouton_actif; // AJOUTÉ : déclarer la variable globale

    if typeof(img) <> "constant" then
        [rows, cols, ch] = size(img);

        // Centre et rayon du cercle
        cx = cols/2;
        cy = rows/2;
        R = min(cx, cy);

        // Création du masque circulaire
        [X, Y] = ndgrid(1:rows, 1:cols);
        mask = (X - cy).^2 + (Y - cx).^2 <= R^2;

        // Image avec fond noir, cercle visible
        img_circle = zeros(rows, cols, ch);
        for k = 1:ch
            tmp = img(:,:,k);
            tmp_masked = zeros(rows, cols);
            tmp_masked(mask) = tmp(mask); // garder les pixels dans le cercle
            img_circle(:,:,k) = tmp_masked;
        end

        // Affichage dans l'axes existant
        if exists("axes") then
            axes();  // sélectionner ton axes
            imshow(img_circle); // affiche dans l'axes courant
        else
            imshow(img_circle); // si axes non défini, ouvre une nouvelle figure
        end

        img = img_circle; // mise à jour

        // AJOUTÉ : Remettre l'ancien bouton violet en bleu
        if bouton_actif <> [] then
            set(bouton_actif, "BackgroundColor", [0.1 0.1 0.3]);
        end
        
        // AJOUTÉ : Mettre le nouveau bouton en violet et le sauvegarder
        h = gcbo();
        set(h, "BackgroundColor", [0.5 0 0.5]);
        bouton_actif = h;
        
    else
        disp("Aucune image à traiter !");
    end
endfunction

function histo_gris(img)
    global bouton_actif; // AJOUTÉ : déclarer la variable globale
    
    // Vérifie si l'image est valide
    if typeof(img) == "constant" then
        disp("Aucune image chargée !");
        return;
    end

    [rows, cols, ch] = size(img);

    // Si l'image est en couleur → convertir en niveaux de gris
    if ch == 3 then
        R = double(img(:,:,1));
        G = double(img(:,:,2));
        B = double(img(:,:,3));
        gray = round(0.299*R + 0.587*G + 0.114*B);
    else
        gray = double(img);
    end

    // Créer la figure
    figure("Position", [200, 100, 500, 400], ...
           "Figure_name", "Histogramme - Niveaux de gris");

    // Tracer l'histogramme
    histplot(256, gray(:));
    xtitle("Histogramme - Niveaux de gris", "Intensité", "Nombre de pixels");
    drawnow();

    // AJOUTÉ : Remettre l'ancien bouton violet en bleu
    if bouton_actif <> [] then
        set(bouton_actif, "BackgroundColor", [0.1 0.1 0.3]);
    end
    
    // AJOUTÉ : Mettre le nouveau bouton en violet et le sauvegarder
    h = gcbo();
    set(h, "BackgroundColor", [0.5 0 0.5]);
    bouton_actif = h;
endfunction

function histo_rouge(img)
    global bouton_actif; // AJOUTÉ : déclarer la variable globale
    
    // Vérifie si l'image est valide
    if typeof(img) == "constant" then
        disp("Aucune image chargée !");
        return;
    end

    [rows, cols, ch] = size(img);

    // Vérifie que c'est bien une image couleur
    if ch <> 3 then
        disp("Cette image n''a pas de canal Rouge (image en niveaux de gris).");
        return;
    end

    // Extraire le canal Rouge et convertir en double
    R = double(img(:,:,1));

    // Créer la figure
    figure("Position", [250, 100, 500, 400], ...
           "Figure_name", "Histogramme - Rouge (R)");

    // Tracer l'histogramme du canal Rouge
    histplot(256, R(:));
    xtitle("Histogramme - Rouge (R)", "Intensité", "Nombre de pixels");
    drawnow();

    // AJOUTÉ : Remettre l'ancien bouton violet en bleu
    if bouton_actif <> [] then
        set(bouton_actif, "BackgroundColor", [0.1 0.1 0.3]);
    end
    
    // AJOUTÉ : Mettre le nouveau bouton en violet et le sauvegarder
    h = gcbo();
    set(h, "BackgroundColor", [0.5 0 0.5]);
    bouton_actif = h;
endfunction

function histo_bleu(img)
    global bouton_actif; // AJOUTÉ : déclarer la variable globale
    
    // Vérifie si l'image est valide
    if typeof(img) == "constant" then
        disp("Aucune image chargée !");
        return;
    end

    [rows, cols, ch] = size(img);

    // Vérifie que c'est bien une image couleur
    if ch <> 3 then
        disp("Cette image n''a pas de canal Bleu (image en niveaux de gris).");
        return;
    end

    // Extraire le canal Bleu et convertir en double
    B = double(img(:,:,3));

    // Créer la figure
    figure("Position", [350, 100, 500, 400], ...
           "Figure_name", "Histogramme - Bleu (B)");

    // Tracer l'histogramme du canal Bleu
    histplot(256, B(:));
    xtitle("Histogramme - Bleu (B)", "Intensité", "Nombre de pixels");
    drawnow();

    // AJOUTÉ : Remettre l'ancien bouton violet en bleu
    if bouton_actif <> [] then
        set(bouton_actif, "BackgroundColor", [0.1 0.1 0.3]);
    end
    
    // AJOUTÉ : Mettre le nouveau bouton en violet et le sauvegarder
    h = gcbo();
    set(h, "BackgroundColor", [0.5 0 0.5]);
    bouton_actif = h;
endfunction

function histo_vert(img)
    global bouton_actif; // AJOUTÉ : déclarer la variable globale
    
    // Vérifie si l'image est valide
    if typeof(img) == "constant" then
        disp("Aucune image chargée !");
        return;
    end

    [rows, cols, ch] = size(img);

    // Vérifie que c'est bien une image couleur
    if ch <> 3 then
        disp("Cette image n''a pas de canal Vert (image en niveaux de gris).");
        return;
    end

    // Extraire le canal Vert et convertir en double
    G = double(img(:,:,2));

    // Créer la figure
    figure("Position", [300, 100, 500, 400], ...
           "Figure_name", "Histogramme - Vert (G)");

    // Tracer l'histogramme du canal Vert
    histplot(256, G(:));
    xtitle("Histogramme - Vert (G)", "Intensité", "Nombre de pixels");
    drawnow();

    // AJOUTÉ : Remettre l'ancien bouton violet en bleu
    if bouton_actif <> [] then
        set(bouton_actif, "BackgroundColor", [0.1 0.1 0.3]);
    end
    
    // AJOUTÉ : Mettre le nouveau bouton en violet et le sauvegarder
    h = gcbo();
    set(h, "BackgroundColor", [0.5 0 0.5]);
    bouton_actif = h;
endfunction

function histo_cumule(img)
    global bouton_actif; // AJOUTÉ : déclarer la variable globale
    
    // Vérification de l'image
    if isempty(img) then
        disp("⚠️ Aucune image chargée !");
        return;
    end

    // Détection du nombre de canaux
    s = size(img);
    if length(s) == 3 then
        // Conversion en niveaux de gris
        R = double(img(:,:,1));
        G = double(img(:,:,2));
        B = double(img(:,:,3));
        gray = round(0.299*R + 0.587*G + 0.114*B);
    else
        gray = double(img);
    end

    // Forcer les valeurs entre 0 et 255
    gray(gray < 0) = 0;
    gray(gray > 255) = 255;

    // Calcul de l'histogramme
    H = zeros(1, 256);
    for i = 0:255
        H(i+1) = sum(gray(:) == i);
    end

    // Histogramme cumulé
    H_cum = cumsum(H);

    // Affichage des infos utiles
    disp("✅ Histogramme cumulé calculé !");
    disp("Min intensité:", min(gray), "Max intensité:", max(gray));
    disp("Pixels totaux:", sum(H));

    // Tracé du graphique
    figure("Position", [500, 100, 500, 400], "Figure_name", "Histogramme cumulé");
    plot(0:255, H_cum, "LineWidth", 2);
    xtitle("Histogramme cumulé", "Intensité (0–255)", "Cumul des pixels");
    xgrid();
    drawnow();

    // AJOUTÉ : Remettre l'ancien bouton violet en bleu
    if bouton_actif <> [] then
        set(bouton_actif, "BackgroundColor", [0.1 0.1 0.3]);
    end
    
    // AJOUTÉ : Mettre le nouveau bouton en violet et le sauvegarder
    h = gcbo();
    set(h, "BackgroundColor", [0.5 0 0.5]);
    bouton_actif = h;
endfunction

function histo_normalise(img)
    global bouton_actif; // AJOUTÉ : déclarer la variable globale
    
    // Vérifie si l'image est valide
    if isempty(img) then
        disp("⚠️ Aucune image chargée !");
        return;
    end

    // Détection du nombre de canaux
    s = size(img);
    if length(s) == 3 then
        R = double(img(:,:,1));
        G = double(img(:,:,2));
        B = double(img(:,:,3));
        gray = round(0.299*R + 0.587*G + 0.114*B);
    else
        gray = double(img);
        R = gray; G = gray; B = gray;
    end

    N = size(gray, "r") * size(gray, "c"); // nombre total de pixels

    // Initialiser les histogrammes
    H_gray = zeros(1, 256);
    H_R = zeros(1, 256);
    H_G = zeros(1, 256);
    H_B = zeros(1, 256);

    // Calculer les histogrammes manuellement
    for i = 0:255
        H_gray(i+1) = sum(gray(:) == i);
        H_R(i+1) = sum(R(:) == i);
        H_G(i+1) = sum(G(:) == i);
        H_B(i+1) = sum(B(:) == i);
    end

    // Normaliser
    H_gray_norm = H_gray / N;
    H_R_norm = H_R / N;
    H_G_norm = H_G / N;
    H_B_norm = H_B / N;

    // Créer une figure
    figure("Position", [200, 100, 1000, 600], "Figure_name", "Histogramme Normalisé");

    // Histogramme niveaux de gris
    subplot(2,2,1);
    plot(0:255, H_gray_norm, "LineWidth", 2);
    xtitle("Niveaux de gris normalisés", "Intensité", "Proportion de pixels");
    xgrid();

    // Histogramme Rouge
    subplot(2,2,2);
    plot(0:255, H_R_norm, "r", "LineWidth", 2);
    xtitle("Rouge (R) normalisé", "Intensité", "Proportion de pixels");
    xgrid();

    // Histogramme Vert
    subplot(2,2,3);
    plot(0:255, H_G_norm, "g", "LineWidth", 2);
    xtitle("Vert (G) normalisé", "Intensité", "Proportion de pixels");
    xgrid();

    // Histogramme Bleu
    subplot(2,2,4);
    plot(0:255, H_B_norm, "b", "LineWidth", 2);
    xtitle("Bleu (B) normalisé", "Intensité", "Proportion de pixels");
    xgrid();

    drawnow();

    // AJOUTÉ : Remettre l'ancien bouton violet en bleu
    if bouton_actif <> [] then
        set(bouton_actif, "BackgroundColor", [0.1 0.1 0.3]);
    end
    
    // AJOUTÉ : Mettre le nouveau bouton en violet et le sauvegarder
    h = gcbo();
    set(h, "BackgroundColor", [0.5 0 0.5]);
    bouton_actif = h;
endfunction

function histo_luminance(img)
    global bouton_actif; // AJOUTÉ : déclarer la variable globale
    
    // Vérifie si l'image est valide
    if isempty(img) then
        disp("⚠️ Aucune image chargée !");
        return;
    end

    // Détection du nombre de canaux
    s = size(img);
    if length(s) == 3 then
        R = double(img(:,:,1));
        G = double(img(:,:,2));
        B = double(img(:,:,3));
        // Calcul de la luminance
        lum = round(0.299*R + 0.587*G + 0.114*B);
    else
        lum = double(img); // si déjà niveaux de gris
    end

    // Forcer les valeurs entre 0 et 255
    lum(lum < 0) = 0;
    lum(lum > 255) = 255;

    // Histogramme manuel (256 valeurs garanties)
    H = zeros(1, 256);
    for i = 0:255
        H(i+1) = sum(lum(:) == i);
    end

    // Création de la figure
    figure("Position", [200, 100, 600, 400], "Figure_name", "Histogramme de Luminance");
    plot(0:255, H, "LineWidth", 2);
    xtitle("Histogramme de luminance", "Intensité (0–255)", "Nombre de pixels");
    xgrid();
    drawnow();

    // AJOUTÉ : Remettre l'ancien bouton violet en bleu
    if bouton_actif <> [] then
        set(bouton_actif, "BackgroundColor", [0.1 0.1 0.3]);
    end
    
    // AJOUTÉ : Mettre le nouveau bouton en violet et le sauvegarder
    h = gcbo();
    set(h, "BackgroundColor", [0.5 0 0.5]);
    bouton_actif = h;
endfunction

function histo_contraste(img)
    global bouton_actif; // AJOUTÉ : déclarer la variable globale
    
    // Vérifie si l'image est chargée
    if isempty(img) then
        disp("⚠️ Aucune image chargée !");
        return;
    end

    // Détection du nombre de canaux
    s = size(img);
    if length(s) == 3 then
        R = double(img(:,:,1));
        G = double(img(:,:,2));
        B = double(img(:,:,3));
        // Calcul de la luminance
        lum = 0.299*R + 0.587*G + 0.114*B;
    else
        lum = double(img);
    end

    // Forcer les valeurs entre 0 et 255
    lum(lum < 0) = 0;
    lum(lum > 255) = 255;

    // Calcul de la moyenne et du contraste (écart-type)
    moyenne = mean(lum(:));
    contraste = stdev(lum(:));

    // Afficher les résultats
    figure("Position", [200, 100, 400, 200], "Figure_name", "Contraste de l''image");
    xstring(0.1, 0.6, "Luminance moyenne : " + string(moyenne));
    xstring(0.1, 0.4, "Contraste (écart-type) : " + string(contraste));
    xstring(0.1, 0.2, "(Plus la valeur est élevée, plus le contraste est fort)");

    // AJOUTÉ : Remettre l'ancien bouton violet en bleu
    if bouton_actif <> [] then
        set(bouton_actif, "BackgroundColor", [0.1 0.1 0.3]);
    end
    
    // AJOUTÉ : Mettre le nouveau bouton en violet et le sauvegarder
    h = gcbo();
    set(h, "BackgroundColor", [0.5 0 0.5]);
    bouton_actif = h;
endfunction


function filtrage_passe_bas(img)
    global bouton_actif; // AJOUTÉ : déclarer la variable globale
    
    // Vérifie si une image est chargée
    if typeof(img) == "constant" then
        disp("Aucune image chargée !");
        return;
    end

    // Créer un noyau passe-bas (moyenneur 3x3)
    h = ones(3,3) / 9;

    [rows, cols, ch] = size(img);

    // Si image couleur → appliquer le filtre sur chaque canal
    if ch == 3 then
        R = conv2(double(img(:,:,1)), h, "same");
        G = conv2(double(img(:,:,2)), h, "same");
        B = conv2(double(img(:,:,3)), h, "same");
        img_filtre = cat(3, R, G, B);
    else
        img_filtre = conv2(double(img), h, "same");
    end

    // Affichage
    figure("Position", [200, 100, 900, 400], "Figure_name", "Filtrage Passe-Bas");
    subplot(1,2,1);
    imshow(uint8(img));
    title("Image originale");

    subplot(1,2,2);
    imshow(uint8(img_filtre));
    title("Image après filtrage Passe-Bas (flou léger)");

    // AJOUTÉ : Remettre l'ancien bouton violet en bleu
    if bouton_actif <> [] then
        set(bouton_actif, "BackgroundColor", [0.1 0.1 0.3]);
    end
    
    // AJOUTÉ : Mettre le nouveau bouton en violet et le sauvegarder
    h = gcbo();
    set(h, "BackgroundColor", [0.5 0 0.5]);
    bouton_actif = h;
endfunction

function filtrage_passe_haut(img)
    global bouton_actif; // AJOUTÉ : déclarer la variable globale
    
    // Vérifie si une image est chargée
    if typeof(img) == "constant" then
        disp("Aucune image chargée !");
        return;
    end

    // Noyau passe-haut simple (accentue les contours)
    h = [0 -1 0;
        -1 5 -1;
         0 -1 0];

    [rows, cols, ch] = size(img);

    // Si image couleur → appliquer le filtre sur chaque canal
    if ch == 3 then
        R = conv2(double(img(:,:,1)), h, "same");
        G = conv2(double(img(:,:,2)), h, "same");
        B = conv2(double(img(:,:,3)), h, "same");
        img_filtre = cat(3, R, G, B);
    else
        img_filtre = conv2(double(img), h, "same");
    end

    // Affichage
    figure("Position", [200, 100, 900, 400], "Figure_name", "Filtrage Passe-Haut");
    subplot(1,2,1);
    imshow(uint8(img));
    title("Image originale");

    subplot(1,2,2);
    imshow(uint8(img_filtre));
    title("Image après filtrage Passe-Haut (renforcement des contours)");

    // AJOUTÉ : Remettre l'ancien bouton violet en bleu
    if bouton_actif <> [] then
        set(bouton_actif, "BackgroundColor", [0.1 0.1 0.3]);
    end
    
    // AJOUTÉ : Mettre le nouveau bouton en violet et le sauvegarder
    h = gcbo();
    set(h, "BackgroundColor", [0.5 0 0.5]);
    bouton_actif = h;
endfunction

function filtrage_passe_bande(img)
    global bouton_actif; // AJOUTÉ : déclarer la variable globale
    
    // Vérifie si l'image est valide
    if typeof(img) == "constant" then
        disp("Aucune image chargée !");
        return;
    end





    [rows, cols, ch] = size(img);

    // Deux filtres moyenneurs de tailles différentes
    h1 = ones(3,3) / 9;   // petit flou
    h2 = ones(7,7) / 49;  // flou plus fort

    // Si image couleur → appliquer sur chaque canal
    if ch == 3 then
        R = double(img(:,:,1));
        G = double(img(:,:,2));
        B = double(img(:,:,3));

        R1 = conv2(R, h1, "same");
        R2 = conv2(R, h2, "same");
        G1 = conv2(G, h1, "same");
        G2 = conv2(G, h2, "same");
        B1 = conv2(B, h1, "same");
        B2 = conv2(B, h2, "same");

        // Passe-bande = petit flou - grand flou
        Rb = R1 - R2;
        Gb = G1 - G2;
        Bb = B1 - B2;

        img_filtre = cat(3, Rb, Gb, Bb);
    else
        I1 = conv2(double(img), h1, "same");
        I2 = conv2(double(img), h2, "same");
        img_filtre = I1 - I2;
    end

    // Affichage
    figure("Position", [200, 100, 900, 400], "Figure_name", "Filtrage Passe-Bande");
    subplot(1,2,1);
    imshow(uint8(img));
    title("Image originale");

    subplot(1,2,2);
    imshow(uint8(abs(img_filtre)));
    title("Image après filtrage Passe-Bande");

    // AJOUTÉ : Remettre l'ancien bouton violet en bleu
    if bouton_actif <> [] then
        set(bouton_actif, "BackgroundColor", [0.1 0.1 0.3]);
    end
    
    // AJOUTÉ : Mettre le nouveau bouton en violet et le sauvegarder
    h = gcbo();
    set(h, "BackgroundColor", [0.5 0 0.5]);
    bouton_actif = h;
endfunction


function filtre_median_3x3()
    global img;
    global bouton_actif; // AJOUTÉ : déclarer la variable globale
    
    if typeof(img) == "constant" then
        disp("Aucune image chargée !");
        return;
    end

    // Conversion en niveaux de gris si nécessaire
    [rows, cols, ch] = size(img);
    if ch == 3 then
        img_gray = rgb2gray(img);
    else
        img_gray = img;
    end

    // Application du filtre médian
    img_median = zeros(rows, cols);
    for i = 2:rows-1
        for j = 2:cols-1
            bloc = img_gray(i-1:i+1, j-1:j+1);
            img_median(i,j) = median(bloc(:));
        end
    end

    // Affichage des résultats
    figure("Position", [100, 100, 800, 400], "Figure_name", "Filtre Médian 3x3");
    subplot(1,2,1);
    imshow(img_gray);
    title("Image originale");
    
    subplot(1,2,2);
    imshow(uint8(img_median));
    title("Image après filtre médian");

    // AJOUTÉ : Remettre l'ancien bouton violet en bleu
    if bouton_actif <> [] then
        set(bouton_actif, "BackgroundColor", [0.1 0.1 0.3]);
    end
    
    // AJOUTÉ : Mettre le nouveau bouton en violet et le sauvegarder
    h = gcbo();
    set(h, "BackgroundColor", [0.5 0 0.5]);
    bouton_actif = h;
endfunction

function filtrage_gaussien()
    global img;
    global bouton_actif; // AJOUTÉ : déclarer la variable globale

    if isempty(img) then
        messagebox("⚠️ Aucune image chargée !");
        return;
    end

    // Conversion en niveaux de gris si nécessaire
    s = size(img);
    if length(s) == 3 then
        R = double(img(:,:,1));
        G = double(img(:,:,2));
        B = double(img(:,:,3));
        img_gray = round(0.299*R + 0.587*G + 0.114*B);
    else
        img_gray = double(img);
    end

    // Générer un noyau gaussien 11x11
    sigma = 2.0;
    n = 11;
    center = floor(n/2);
    G_kernel = zeros(n, n);

    for i = 1:n
        for j = 1:n
            x = i - center - 1;
            y = j - center - 1;
            G_kernel(i,j) = exp(-(x^2 + y^2)/(2*sigma^2));
        end
    end

    G_kernel = G_kernel / sum(G_kernel); // Normalisation

    // Appliquer la convolution
    img_gauss = conv2(img_gray, G_kernel, "same");

    // Afficher dans une nouvelle fenêtre
    figure("Position", [100, 100, 800, 400], "Figure_name", "Filtrage Gaussien 11×11");

    subplot(1,2,1);
    imshow(uint8(img_gray));
    title("Image originale (niveau de gris)");

    subplot(1,2,2);
    imshow(uint8(img_gauss));
    title("Image filtrée (Gaussien 11×11)");

    // AJOUTÉ : Remettre l'ancien bouton violet en bleu
    if bouton_actif <> [] then
        set(bouton_actif, "BackgroundColor", [0.1 0.1 0.3]);
    end
    
    // AJOUTÉ : Mettre le nouveau bouton en violet et le sauvegarder
    h = gcbo();
    set(h, "BackgroundColor", [0.5 0 0.5]);
    bouton_actif = h;
endfunction


function filtrage_moyenneur()
    global img;
    global bouton_actif; // AJOUTÉ : déclarer la variable globale

    if isempty(img) then
        messagebox("⚠️ Aucune image chargée !");
        return;
    end

    // Conversion en niveaux de gris si nécessaire
    s = size(img);
    if length(s) == 3 then
        R = double(img(:,:,1));
        G = double(img(:,:,2));
        B = double(img(:,:,3));
        img_gray = round(0.299*R + 0.587*G + 0.114*B);
    else
        img_gray = double(img);
    end

    [rows, cols] = size(img_gray);
    img_noisy = img_gray;

    // Ajouter du bruit poivre et sel (5 % des pixels)
    p = 0.05;
    n_pixels = round(p * rows * cols);

    // Poivre (0)
    for k = 1:n_pixels/2
        i = grand(1,1,"uin",1,rows);
        j = grand(1,1,"uin",1,cols);
        img_noisy(i,j) = 0;
    end

    // Sel (255)
    for k = 1:n_pixels/2
        i = grand(1,1,"uin",1,rows);
        j = grand(1,1,"uin",1,cols);
        img_noisy(i,j) = 255;
    end

    // Définir un noyau moyenneur 3x3
    kernel = ones(3,3) / 9;

    // Appliquer la convolution
    img_moyenne = conv2(img_noisy, kernel, "same");

    // Afficher les résultats dans une nouvelle fenêtre
    figure("Position", [100, 100, 1200, 400], "Figure_name", "Filtrage Moyenneur avec Bruit");

    subplot(1,3,1);
    imshow(uint8(img_gray));
    title("Image originale");

    subplot(1,3,2);
    imshow(uint8(img_noisy));
    title("Image avec bruit (poivre et sel)");

    subplot(1,3,3);
    imshow(uint8(img_moyenne));
    title("Image filtrée (moyenneur)");

    // AJOUTÉ : Remettre l'ancien bouton violet en bleu
    if bouton_actif <> [] then
        set(bouton_actif, "BackgroundColor", [0.1 0.1 0.3]);
    end
    
    // AJOUTÉ : Mettre le nouveau bouton en violet et le sauvegarder
    h = gcbo();
    set(h, "BackgroundColor", [0.5 0 0.5]);
    bouton_actif = h;
endfunction

function seuillage_global(img)
    global bouton_actif; // AJOUTÉ : déclarer la variable globale
    
    // Vérifier si une image est chargée
    if typeof(img) == "constant" then
        disp("Aucune image chargée !");
        return;
    end

    // Si l'image est en couleur, on la convertit en niveaux de gris
    [rows, cols, ch] = size(img);
    if ch == 3 then
        gray = rgb2gray(img);
    else
        gray = img;
    end

    // Choisir un seuil global (exemple : 128 sur 255)
    T = 128;

    // Appliquer le seuillage global
    img_seuil = zeros(rows, cols);
    img_seuil(gray > T) = 1; // Les pixels supérieurs au seuil deviennent blancs

    // Afficher les résultats
    f = figure("Position", [100, 100, 800, 400], ...
               "Figure_name", "Seuillage global");

    subplot(1,2,1);
    imshow(gray);
    title("Image originale (niveaux de gris)");

    subplot(1,2,2);
    imshow(img_seuil);
    title("Image seuillée (T = " + string(T) + ")");

    // AJOUTÉ : Remettre l'ancien bouton violet en bleu
    if bouton_actif <> [] then
        set(bouton_actif, "BackgroundColor", [0.1 0.1 0.3]);
    end
    
    // AJOUTÉ : Mettre le nouveau bouton en violet et le sauvegarder
    h = gcbo();
    set(h, "BackgroundColor", [0.5 0 0.5]);
    bouton_actif = h;
endfunction

function calcul_laplacien(img)
    global bouton_actif; // AJOUTÉ : déclarer la variable globale
    
    // Vérifie si une image est chargée
    if typeof(img) == "constant" then
        disp("Aucune image chargée !");
        return;
    end

    // Conversion en niveau de gris si besoin
    [rows, cols, ch] = size(img);
    if ch == 3 then
        gray = rgb2gray(img);
    else
        gray = img;
    end

    // Définition du masque du Laplacien (3x3)
    laplacien_mask = [0  1  0;
                      1 -4  1;
                      0  1  0];

    // Application du filtre Laplacien
    laplacien_img = conv2(double(gray), laplacien_mask, 'same');

    // Normalisation pour affichage
    laplacien_img = abs(laplacien_img);
    laplacien_img = laplacien_img / max(laplacien_img);

    // Affichage des résultats
    f = figure("Position", [100, 100, 800, 400], ...
               "Figure_name", "Filtrage Laplacien");

    subplot(1,2,1);
    imshow(gray);
    title("Image originale (niveaux de gris)");

    subplot(1,2,2);
    imshow(laplacien_img);
    title("Image après filtre Laplacien");

    // AJOUTÉ : Remettre l'ancien bouton violet en bleu
    if bouton_actif <> [] then
        set(bouton_actif, "BackgroundColor", [0.1 0.1 0.3]);
    end
    
    // AJOUTÉ : Mettre le nouveau bouton en violet et le sauvegarder
    h = gcbo();
    set(h, "BackgroundColor", [0.5 0 0.5]);
    bouton_actif = h;
endfunction

function gradient_seuille(img)
    global bouton_actif; // AJOUTÉ : déclarer la variable globale
    
    // Vérifie si l'image est chargée
    if typeof(img) == "constant" then
        disp("Aucune image chargée !");
        return;
    end

    // Conversion en niveaux de gris
    [rows, cols, ch] = size(img);
    if ch == 3 then
        gray = rgb2gray(img);
    else
        gray = img;
    end

    // Définir les masques de Sobel (horizontal et vertical)
    sobel_x = [-1 0 1;
               -2 0 2;
               -1 0 1];

    sobel_y = [-1 -2 -1;
                0  0  0;
                1  2  1];

    // Calcul du gradient horizontal et vertical
    Gx = conv2(double(gray), sobel_x, "same");
    Gy = conv2(double(gray), sobel_y, "same");

    // Magnitude du gradient
    G = sqrt(Gx.^2 + Gy.^2);

    // Normalisation
    G = G / max(G);

    // Application d'un seuil (exemple : 0.3)
    T = 0.3;
    G_seuil = G > T;

    // Affichage
    f = figure("Position", [100, 100, 1000, 400], ...
               "Figure_name", "Gradient Seuillé (Sobel)");

    subplot(1,3,1);
    imshow(gray);
    title("Image originale (niveaux de gris)");

    subplot(1,3,2);
    imshow(G);
    title("Magnitude du gradient");

    subplot(1,3,3);
    imshow(G_seuil);
    title("Gradient seuillé (T = " + string(T) + ")");

    // AJOUTÉ : Remettre l'ancien bouton violet en bleu
    if bouton_actif <> [] then
        set(bouton_actif, "BackgroundColor", [0.1 0.1 0.3]);
    end
    
    // AJOUTÉ : Mettre le nouveau bouton en violet et le sauvegarder
    h = gcbo();
    set(h, "BackgroundColor", [0.5 0 0.5]);
    bouton_actif = h;
endfunction

function seuillage_otsu(img)
    global bouton_actif; // AJOUTÉ : déclarer la variable globale
    
    if typeof(img) == "constant" then
        disp("Aucune image chargée !");
        return;
    end

    // Conversion en niveaux de gris si nécessaire
    [rows, cols, ch] = size(img);
    if ch == 3 then
        gray = rgb2gray(img);
    else
        gray = img;
    end

    // Conversion en double pour les calculs
    gray = im2double(gray);

    // Calcul de l'histogramme
    [counts, levels] = imhist(gray);

    // Normaliser l'histogramme
    p = counts / sum(counts);

    // Moyenne totale
    mean_total = sum(levels .* p);

    best_thresh = 0;
    max_variance = 0;
    w0 = 0;
    mean0 = 0;

    // Recherche du seuil optimal
    for t = 1:length(levels)
        w0 = w0 + p(t);
        if w0 == 0 then
            continue;
        end
        w1 = 1 - w0;
        if w1 == 0 then
            break;
        end

        mean0 = mean0 + levels(t) * p(t);
        mean1 = (mean_total - mean0) / w1;

        // Variance inter-classes
        variance_between = w0 * w1 * (mean0 / w0 - mean1)^2;

        if variance_between > max_variance then
            max_variance = variance_between;
            best_thresh = levels(t);
        end
    end

    // Appliquer le seuillage avec le seuil optimal trouvé
    result = gray > best_thresh;

    // Affichage côte à côte
    f = figure("Position", [100, 100, 1000, 400], ...
               "Figure_name", "Seuillage automatique (Otsu)");

    subplot(1,2,1);
    imshow(gray);
    title("Image originale (niveaux de gris)");

    subplot(1,2,2);
    imshow(result);
    title("Image seuillée (Otsu) - Seuil = " + string(best_thresh));

    // AJOUTÉ : Remettre l'ancien bouton violet en bleu
    if bouton_actif <> [] then
        set(bouton_actif, "BackgroundColor", [0.1 0.1 0.3]);
    end
    
    // AJOUTÉ : Mettre le nouveau bouton en violet et le sauvegarder
    h = gcbo();
    set(h, "BackgroundColor", [0.5 0 0.5]);
    bouton_actif = h;
endfunction

function addition_image_nb(img)
    global bouton_actif; // AJOUTÉ : déclarer la variable globale
    
    if typeof(img) == "constant" then
        disp("Aucune image chargée !");
        return;
    end

    // Vérifie si l'image est en couleur ou non
    [rows, cols, ch] = size(img);

    if ch == 3 then
        // Conversion en niveau de gris
        gray = rgb2gray(img);
        // Étendre le niveau de gris sur 3 canaux pour l’addition
        gray3 = cat(3, gray, gray, gray);
    else
        gray = img;
        gray3 = cat(3, gray, gray, gray);
    end

    // Normalisation des valeurs (0 à 1)
    img_norm = im2double(img);
    gray_norm = im2double(gray3);

    // Addition pixel à pixel
    result = img_norm + gray_norm;

    // Éviter dépassement > 1
    result = min(result, 1);

    // Affichage
    f = figure("Position", [100, 100, 1200, 400], ...
               "Figure_name", "Addition image originale + noir et blanc");

    subplot(1,3,1);
    imshow(img_norm);
    title("Image originale");

    subplot(1,3,2);
    imshow(gray_norm);
    title("Image en noir et blanc");

    subplot(1,3,3);
    imshow(result);
    title("Image additionnée");

    // AJOUTÉ : Remettre l'ancien bouton violet en bleu
    if bouton_actif <> [] then
        set(bouton_actif, "BackgroundColor", [0.1 0.1 0.3]);
    end
    
    // AJOUTÉ : Mettre le nouveau bouton en violet et le sauvegarder
    h = gcbo();
    set(h, "BackgroundColor", [0.5 0 0.5]);
    bouton_actif = h;
endfunction

function soustraction_image_nb(img)
    global bouton_actif; // AJOUTÉ : déclarer la variable globale
    
    if typeof(img) == "constant" then
        disp("Aucune image chargée !");
        return;
    end

    // Vérifie si l'image est en couleur
    [rows, cols, ch] = size(img);

    if ch == 3 then
        // Convertir en niveaux de gris
        gray = rgb2gray(img);
        // Étendre le canal gris en 3 couches pour soustraction
        gray3 = cat(3, gray, gray, gray);
    else
        gray = img;
        gray3 = cat(3, gray, gray, gray);
    end

    // Normaliser (valeurs entre 0 et 1)
    img_norm = im2double(img);
    gray_norm = im2double(gray3);

    // Soustraction pixel à pixel
    result = img_norm - gray_norm;

    // Éviter valeurs négatives < 0
    result = max(result, 0);

    // Affichage
    f = figure("Position", [100, 100, 1200, 400], ...
               "Figure_name", "Soustraction image originale - noir et blanc");

    subplot(1,3,1);
    imshow(img_norm);
    title("Image originale");

    subplot(1,3,2);
    imshow(gray_norm);
    title("Image en noir et blanc");

    subplot(1,3,3);
    imshow(result);
    title("Image soustraite");

    // AJOUTÉ : Remettre l'ancien bouton violet en bleu
    if bouton_actif <> [] then
        set(bouton_actif, "BackgroundColor", [0.1 0.1 0.3]);
    end
    
    // AJOUTÉ : Mettre le nouveau bouton en violet et le sauvegarder
    h = gcbo();
    set(h, "BackgroundColor", [0.5 0 0.5]);
    bouton_actif = h;
endfunction

function soustraction_image_laplacien(img)
    global bouton_actif; // AJOUTÉ : déclarer la variable globale
    
    if typeof(img) == "constant" then
        disp("Aucune image chargée !");
        return;
    end

    // Vérifier si l'image est couleur ou N&B
    [rows, cols, ch] = size(img);

    // Convertir en niveau de gris pour le calcul du Laplacien
    if ch == 3 then
        gray = rgb2gray(img);
    else
        gray = img;
    end

    // Masque Laplacien (détection de contours)
    laplacien_mask = [0 -1 0; -1 4 -1; 0 -1 0];
    lap = conv2(double(gray), laplacien_mask, "same");

    // Normalisation
    lap = lap - min(lap);
    lap = lap / max(lap);

    // Conversion de l'image originale en double
    img_norm = im2double(img);

    // Si image couleur, on soustrait le Laplacien sur chaque canal
    if ch == 3 then
        lap3 = cat(3, lap, lap, lap);
        result = img_norm - lap3;
    else
        result = img_norm - lap;
    end

    // Corriger les valeurs pour rester entre 0 et 1
    result = max(min(result, 1), 0);

    // Affichage
    f = figure("Position", [100, 100, 1200, 400], ...
               "Figure_name", "Soustraction : Image - Laplacien");

    subplot(1,3,1);
    imshow(img_norm);
    title("Image originale");

    subplot(1,3,2);
    imshow(lap);
    title("Laplacien (contours)");

    subplot(1,3,3);
    imshow(result);
    title("Résultat : Image - Soustraire avec Laplacien");

    // AJOUTÉ : Remettre l'ancien bouton violet en bleu
    if bouton_actif <> [] then
        set(bouton_actif, "BackgroundColor", [0.1 0.1 0.3]);
    end
    
    // AJOUTÉ : Mettre le nouveau bouton en violet et le sauvegarder
    h = gcbo();
    set(h, "BackgroundColor", [0.5 0 0.5]);
    bouton_actif = h;
endfunction

function multiplication_image_rouge(img)
    global bouton_actif; // AJOUTÉ : déclarer la variable globale
    
    // Vérifie l'image
    if typeof(img) == "constant" then
        disp("Aucune image chargée !");
        return;
    end

    // Taille et conversion
    [rows, cols, ch] = size(img);

    // Normaliser l'image originale en double [0..1]
    img_norm = im2double(img);

    // Créer la version "teintée en rouge"
    // Méthode : on prend la luminance (gris) et on la place dans le canal R
    if ch == 3 then
        gray = rgb2gray(img);           // niveaux de gris (0..255)
    else
        gray = img;                     // si déjà NB
    end
    gray_norm = im2double(gray);       // normalisation [0..1]

    // Construire l'image teintée en rouge : R = gray, G = 0, B = 0
    red_tint = zeros(rows, cols, 3);
    red_tint(:,:,1) = gray_norm;       // canal rouge
    // G et B restent à 0

    // Multiplication élément par élément
    // Si image originale est NB (ch==1) on recopie la couche pour multiplier en 3 canaux
    if ch == 1 then
        img_norm3 = cat(3, img_norm, img_norm, img_norm);
    else
        img_norm3 = img_norm;
    end

    result = img_norm3 .* red_tint;    // multiplication (valeurs entre 0 et 1)

    // Pour l'affichage, on peut aussi augmenter légèrement la visibilité :
    // result = min(result, 1); // déjà dans [0,1] mais on sécurise
    result = min(result, 1);

    // Affichage côte à côte
    f = figure("Position", [100, 100, 1200, 420], ...
               "Figure_name", "Original  - Rouge teinté - Multiplication");

    subplot(1,3,1);
    imshow(img_norm3);
    title("Image originale");

    subplot(1,3,2);
    imshow(red_tint);
    title("Image teintée en rouge (luminance → R)");

    subplot(1,3,3);
    imshow(result);
    title("Résultat : Original × Rouge teinté");

    // AJOUTÉ : Remettre l'ancien bouton violet en bleu
    if bouton_actif <> [] then
        set(bouton_actif, "BackgroundColor", [0.1 0.1 0.3]);
    end
    
    // AJOUTÉ : Mettre le nouveau bouton en violet et le sauvegarder
    h = gcbo();
    set(h, "BackgroundColor", [0.5 0 0.5]);
    bouton_actif = h;
endfunction

function addition_negative_floue()
    global img;
    global axes_handle;
    global bouton_actif; // AJOUTÉ : déclarer la variable globale

    if typeof(img) <> "constant" then
        // ======== Conversion en double ========
        img_norm = im2double(img);

        // ======== Créer l'image négative ========
        img_negative = 1 - img_norm;

        // ======== Créer le filtre passe-bas (flou 5x5) ========
        h = ones(5,5)/25;
        img_floue = imfilter(img_norm, h);

        // ======== Addition pixel par pixel ========
        result = img_negative + img_floue;

        // Normaliser pour rester entre 0 et 1
        result = min(result, 1);

        // ======== Affichage ========
        f = figure("Position", [100, 100, 1200, 400], ...
                   "Figure_name", "Addition image négative + floue");

        subplot(1,3,1);
        imshow(img_negative);
        title("Image négative");

        subplot(1,3,2);
        imshow(img_floue);
        title("Image floue (passe-bas)");

        subplot(1,3,3);
        imshow(result);
        title("Résultat : négative + floue");

        // AJOUTÉ : Remettre l'ancien bouton violet en bleu
        if bouton_actif <> [] then
            set(bouton_actif, "BackgroundColor", [0.1 0.1 0.3]);
        end
        
        // AJOUTÉ : Mettre le nouveau bouton en violet et le sauvegarder
        h = gcbo();
        set(h, "BackgroundColor", [0.5 0 0.5]);
        bouton_actif = h;
        
    else
        messagebox("Aucune image importée.", "Information");
    end
endfunction

function mult_negatif()
    global img;
    global axes_handle;
    global bouton_actif; // AJOUTÉ : déclarer la variable globale

    if typeof(img) <> "constant" then
        // Normaliser l'image originale
        img_norm = im2double(img);

        // Créer l'image négative
        img_neg = 1 - img_norm;

        // Multiplication pixel-à-pixel
        result = img_norm .* img_neg;

        // Normaliser si nécessaire (valeurs entre 0 et 1)
        result = min(result, 1);

        // Affichage
        f = figure("Position", [100, 100, 1200, 400], ...
                   "Figure_name", "Multiplication Original × Négatif");

        subplot(1,3,1);
        imshow(img_norm);
        title("Image originale");

        subplot(1,3,2);
        imshow(img_neg);
        title("Image négative");

        subplot(1,3,3);
        imshow(result);
        title("Résultat : Original × Négatif");

        // AJOUTÉ : Remettre l'ancien bouton violet en bleu
        if bouton_actif <> [] then
            set(bouton_actif, "BackgroundColor", [0.1 0.1 0.3]);
        end
        
        // AJOUTÉ : Mettre le nouveau bouton en violet et le sauvegarder
        h = gcbo();
        set(h, "BackgroundColor", [0.5 0 0.5]);
        bouton_actif = h;
        
    else
        messagebox("Aucune image importée.", "Information");
    end
endfunction


// --- Fonction de sauvegarde ---
function sauvegarder_image()
    global img;

    if typeof(img) <> "constant" then
        // Étape 1 : choix du format
        formats = ["PNG"; "JPG"; "BMP"];
        choix = x_choose(formats, "Choisir le format de sauvegarde");

        if choix == 0 then
            return; // utilisateur a annulé
        end

        // Étape 2 : selon le choix, on définit le filtre
        select formats(choix)
        case "PNG" then
            [file, path] = uiputfile("*.png", "Enregistrer en PNG");
            ext = ".png";
        case "JPG" then
            [file, path] = uiputfile("*.jpg", "Enregistrer en JPG");
            ext = ".jpg";
        case "BMP" then
            [file, path] = uiputfile("*.bmp", "Enregistrer en BMP");
            ext = ".bmp";
        end

        // Étape 3 : sauvegarde de l'image
        if file <> "" then
            imwrite(img, path + "/" + file + ext);
            messagebox("Image sauvegardée avec succès en " + formats(choix) + " !", "Information");
        end
    else
        messagebox("Aucune image à sauvegarder.", "Information");
    end
endfunction

// Fonction : Quitter l'application
function quitter_application()
    close(f); // Ferme la fenêtre principale
endfunction


// --- Fonction : afficher les métadonnées ---
function afficher_metadonnees()
    global img;
    global nom_fichier;

    if typeof(img) <> "constant" then
        // Récupération des informations
        [h, w, c] = size(img); // hauteur, largeur, canaux (ex: 3 pour RGB)

        // Détection du type d'image (couleur ou niveaux de gris)
        if c == 3 then
            type_img = "Couleur (RVB)";
        elseif c == 1 then
            type_img = "Niveaux de gris";
        else
            type_img = "Inconnu";
        end

        // Calcul de la profondeur de couleur (approximée à 8 bits/canal)
        profondeur = string(c * 8) + " bits";
        
        // Utiliser le nom du fichier stocké
        if exists('nom_fichier') & nom_fichier <> "" then
            nom_image = nom_fichier;
            
            // Extraire le format à partir du nom du fichier
            if ~isempty(strindex(nom_fichier, '.')) then
                // Séparer le nom et l'extension
                parties = strsplit(nom_fichier, '.');
                if size(parties, '*') > 1 then
                    format_img = parties($); // Dernière partie = extension
                    // Convertir en minuscules pour uniformité
                    format_img = convstr(format_img, 'l');
                else
                    format_img = "Inconnu";
                end
            else
                format_img = "Inconnu";
            end
        else
            nom_image = "Non spécifié";
            format_img = "Inconnu";
        end
        
        // Informations sur la matrice
        dimensions_mat = string(h) + "x" + string(w);
        if c > 1 then
            dimensions_mat = dimensions_mat + "x" + string(c);
        end
        type_mat = typeof(img);
        taille_mat = string(h * w * c) + " éléments";

        // Création du message d'infos
        infos = msprintf( ...
            " Métadonnées de l''image :\n\n" + ...
            "• Nom : %s\n" + ...
            "• Format : %s\n" + ...
            "• Largeur : %d pixels\n" + ...
            "• Hauteur : %d pixels\n" + ...
            "• Type : %s\n" + ...
            "• Profondeur de couleur : %s\n\n" + ...
            "=== MATRICE DE L''IMAGE ===\n" + ...
            "• Dimensions : %s\n" + ...
            "• Type de données : %s\n" + ...
            "• Taille : %s", ...
            nom_image, format_img, w, h, type_img, profondeur, ...
            dimensions_mat, type_mat, taille_mat);

        // Affichage dans une boîte de message
        messagebox(infos, "Métadonnées de l''image");
    else
        messagebox("Aucune image importée.", "Information");
    end
endfunction

function scroll_callback()
    // Fonction vide pour éviter les erreurs
endfunction

/*
global mode_actuel;
mode_actuel = "clair";

// Bouton pour changer le thème 
bouton_theme = uicontrol(f, "Style", "pushbutton", ...
          "String", "Mode sombre / clair", ...
          "Position", [780, 100, 150, 40], ...
          "FontSize", 12, ...
          "BackgroundColor", [0.6 0.6 0.6], ...
          "ForegroundColor", [0 0 0], ...
          "Callback", "changer_theme_toggle()");

// Fonction de bascule du thème
function changer_theme_toggle()
    global mode_actuel;
    if mode_actuel == "clair" then
        activer_mode_sombre();
        mode_actuel = "sombre";
    else
        activer_mode_clair();
        mode_actuel = "clair";
    end
endfunction

// Fonction : mode sombre
function activer_mode_sombre()
    set(f, "BackgroundColor", [0.1 0.1 0.1]);
    set(bouton_theme, "BackgroundColor", [0.3 0.3 0.3]);
    set(bouton_theme, "ForegroundColor", [1 1 1]);
    // Ajoute ici les autres éléments à styliser en sombre
endfunction

// Fonction : mode clair
function activer_mode_clair()
    set(f, "BackgroundColor", [0.2 0.8 0.95]);
    set(bouton_theme, "BackgroundColor", [0.6 0.6 0.6]);
    set(bouton_theme, "ForegroundColor", [0 0 0]);
    // Ajoute ici les autres éléments à styliser en clair
endfunction*/

bouton_langue = uicontrol(f, ...
    "Style", "pushbutton", ...
    "String", "FR / EN", ...
    "Position", [780, 100, 130, 40], ...
    "FontSize", 12, ...
    "BackgroundColor", [0.1 0.1 0.3], ...
    "ForegroundColor", [1 1 1], ...
    "Callback", "changer_langue()");

function changer_langue()
    global langue_actuelle;
    if langue_actuelle == "fr" then
        activer_anglais();
        langue_actuelle = "en";
    else
        activer_francais();
        langue_actuelle = "fr";
    end
endfunction

function activer_anglais()
    set(titre_projet, "String", "Project of Image processing  I - M1 Big Data");
    set(bouton_langue, "String", "EN / FR");
    set(texte_cadre, "String", "No image imported");
    set(bouton_langue, "String", "EN / FR");
    set(bouton_sauvegarder, "String", "Save");
    set(bouton_langue, "String", "EN / FR");
    set(bouton_import, "String", "Import image");
    set(bouton_langue, "String", "EN / FR");
    set(bouton_metadonnees, "String", "Metadata");
    set(bouton_langue, "String", "EN / FR");
    set(bouton_quitter, "String", "Exit");
    set(bouton_langue, "String", "EN / FR");
    set(bouton_reset, "String", "Reset image");
    set(bouton_langue, "String", "EN / FR");
    set(bouton_theme, "String", "Dark / Light mode");
    set(bouton_langue, "String", "EN / FR");
    set(texte_parametres, "String", "───────   SETTINGS   ───────");
    set(bouton_langue, "String", "EN / FR");
    set(texte_filtrage, "String", " FILTERING");
    set(bouton_langue, "String", "EN / FR");
    set(texte_operations, "String", " OPERATIONS");
    set(bouton_langue, "String", "EN / FR");
    set(texte_seuillage, "String", " THRESHOLDING");
    set(bouton_langue, "String", "EN / FR");
    set(texte_histogramme, "String", " HISTOGRAM");
    set(bouton_langue, "String", "EN / FR");
    set(texte_transformations, "String", " GEOMETRIC TRANSFORMATIONS");
    set(bouton_langue, "String", "EN / FR");
    set(texte_palette, "String", "COLOR PALETTE");
    set(bouton_langue, "String", "EN / FR");
    set(bouton_filtre_gaussien, "String", "Gaussian Filter");
    set(bouton_langue, "String", "EN / FR");
    set(bouton_nb, "String", "Black & White Image");
    set(bouton_langue, "String", "EN / FR");
    set(bouton_rouge, "String", "Red Image");
    set(bouton_langue, "String", "EN / FR");
    set(bouton_image_cachee, "String", "Hidden Image");
    set(bouton_langue, "String", "EN / FR");
    set(bouton_addition_nb, "String", "Add with B&W");
    set(bouton_langue, "String", "EN / FR");
    set(bouton_soustraction_laplacien, "String", "Subtract with Laplacian");
    set(bouton_langue, "String", "EN / FR");
    set(bouton_passe_bande, "String", "Band-pass filter");
    set(bouton_langue, "String", "EN / FR");
    set(bouton_bleu, "String", "Blue Image");
    set(bouton_langue, "String", "EN / FR");
    set(bouton_histo_vert, "String", "Green level histogram");
    set(bouton_langue, "String", "EN / FR");
    set(bouton_cisaillement, "String", "Shearing");
    set(bouton_langue, "String", "EN / FR");
    set(bouton_histo_cumule, "String", "Cumulative histogram");
    set(bouton_langue, "String", "EN / FR");
    set(bouton_rotation_90, "String", "Rotate 90°");
    set(bouton_langue, "String", "EN / FR");
    set(bouton_multiplication_rouge, "String", "Multiply with image (R)");
    set(bouton_langue, "String", "EN / FR");
    set(bouton_histo_rouge, "String", "Red level histogram");
    set(bouton_langue, "String", "EN / FR");
    set(bouton_histo_contraste, "String", "Contrast histogram");
    set(bouton_langue, "String", "EN / FR");
    set(bouton_negatif, "String", "Negative image");
    set(bouton_langue, "String", "EN / FR");
    set(bouton_histo_luminance, "String", "Luminance histogram");
    set(bouton_langue, "String", "EN / FR");
    set(bouton_mult_negatif, "String", "Multiply with Negative");
    set(bouton_langue, "String", "EN / FR");
    set(bouton_soustraction_nb, "String", "Subtract with B&W");
    set(bouton_langue, "String", "EN / FR");
    set(bouton_passe_bas_negatif, "String", "Low-pass + negative");
    set(bouton_langue, "String", "EN / FR");
    set(bouton_vert, "String", "Green image");
    set(bouton_langue, "String", "EN / FR");
    set(bouton_decoupage, "String", "Cropping");
    set(bouton_langue, "String", "EN / FR");
    set(bouton_filtre_median, "String", "Median Filter");
    set(bouton_langue, "String", "EN / FR");
    set(bouton_passe_bas, "String", "Low-pass (blurred)");
    set(bouton_langue, "String", "EN / FR");
    set(bouton_miroir, "String", "Mirror mode");
    set(bouton_langue, "String", "EN / FR");
    set(bouton_gradient_seuille, "String", "Thresholded gradient");
    set(bouton_langue, "String", "EN / FR");
    set(bouton_filtre_moyenneur, "String", "Averaging filter + Noise");
    set(bouton_langue, "String", "EN / FR")
    set(bouton_seuillage_auto, "String", "Automatic thresholding");
    set(bouton_langue, "String", "EN / FR");
    set(bouton_laplacien, "String", "Laplacian calculation");
    set(bouton_langue, "String", "EN / FR");
    set(bouton_zoom_x2, "String", "Zoom ×2");
    set(bouton_langue, "String", "EN / FR");
    set(bouton_rotation_180, "String", "Rotate 180°");
    set(bouton_langue, "String", "EN / FR");
    set(bouton_seuillage_global, "String", "Global thresholding");
    set(bouton_langue, "String", "EN / FR");
    set(bouton_passe_haut, "String", "High-pass (edges)");
    set(bouton_langue, "String", "EN / FR");
    set(bouton_histo_normalise, "String", "Normalized histogram");
    set(bouton_langue, "String", "EN / FR");
    set(bouton_histo_gris, "String", "Grayscale histogram");
    set(bouton_langue, "String", "EN / FR");
    set(bouton_histo_bleu, "String", "Blue channel histogram");
    set(bouton_langue, "String", "EN / FR");
endfunction

function activer_francais()
    set(titre_projet, "String", "Projet traitement Image Scilab   - M1 IBD");
    set(bouton_langue, "String", "FR / EN");
    set(texte_cadre, "String", "Aucune image importée");
    set(bouton_langue, "String", "FR / EN");
    set(bouton_sauvegarder, "String", "Sauvegarder");
    set(bouton_langue, "String", "FR / EN");
    set(bouton_import, "String", "Importer une image");
    set(bouton_langue, "String", "FR / EN");
    set(bouton_metadonnees, "String", "Métadonnées");
    set(bouton_langue, "String", "FR / EN");
    set(bouton_quitter, "String", "Quitter");
    set(bouton_langue, "String", "FR / EN");
    set(bouton_reset, "String", "Réinitialiser l''image");
    set(bouton_langue, "String", "FR / EN");
    set(bouton_theme, "String", "Mode sombre / clair");
    set(bouton_langue, "String", "FR / EN");
    set(texte_parametres, "String", "───────   PARAMÈTRES   ───────");
    set(bouton_langue, "String", "FR / EN");
    set(texte_filtrage, "String", " FILTRAGE");
    set(bouton_langue, "String", "FR / EN");
    set(texte_operations, "String", " OPÉRATIONS");
    set(bouton_langue, "String", "FR / EN");
    set(texte_seuillage, "String", " SEUILLAGE");
    set(bouton_langue, "String", "FR / EN");
    set(texte_histogramme, "String", " HISTOGRAMME");
    set(bouton_langue, "String", "FR / EN");
    set(texte_transformations, "String", " TRANSFORMATIONS GEOMETRIQUES");
    set(bouton_langue, "String", "FR / EN");
    set(texte_palette, "String", "PALETTE DE COULEURS");
    set(bouton_langue, "String", "FR / EN");
    set(bouton_filtre_gaussien, "String", "Filtre Gaussien");
    set(bouton_langue, "String", "FR / EN");
    set(bouton_nb, "String", "Image en noir et blanc");
    set(bouton_langue, "String", "FR / EN");
    set(bouton_rouge, "String", "Image en rouge");
    set(bouton_langue, "String", "FR / EN");
    set(bouton_image_cachee, "String", "Image cachée");
    set(bouton_langue, "String", "FR / EN");
    set(bouton_addition_nb, "String", "Additionner avec NB");
    set(bouton_langue, "String", "FR / EN");
    set(bouton_soustraction_laplacien, "String", "Soustraire avec Laplacien");
    set(bouton_langue, "String", "FR / EN");
    set(bouton_passe_bande, "String", "Passe bande");
    set(bouton_langue, "String", "FR / EN");
    set(bouton_bleu, "String", "Image en bleu");
    set(bouton_langue, "String", "FR / EN");
    set(bouton_histo_vert, "String", "Histogramme niveau vert");
    set(bouton_langue, "String", "FR / EN");
    set(bouton_cisaillement, "String", "Cisaillement");
    set(bouton_langue, "String", "FR / EN");
    set(bouton_histo_cumule, "String", "Histogramme cumulé");
    set(bouton_langue, "String", "FR / EN");
    set(bouton_rotation_90, "String", "Rotation 90°");
    set(bouton_langue, "String", "FR / EN");
    set(bouton_multiplication_rouge, "String", "Multiplier avec image (R)");
    set(bouton_langue, "String", "FR / EN");
    set(bouton_histo_rouge, "String", "Histogramme niveau rouge");
    set(bouton_langue, "String", "FR / EN");
    set(bouton_histo_contraste, "String", "Histogramme contraste");
    set(bouton_langue, "String", "FR / EN");
    set(bouton_negatif, "String", "Image négatif");
    set(bouton_langue, "String", "FR / EN");
    set(bouton_histo_luminance, "String", "Histogramme luminance");
    set(bouton_langue, "String", "FR / EN")
    set(bouton_mult_negatif, "String", "Multiplier Négatif");
    set(bouton_langue, "String", "FR / EN");
    set(bouton_soustraction_nb, "String", "Soustraire avec NB");
    set(bouton_langue, "String", "FR / EN");
    set(bouton_passe_bas_negatif, "String", "passe bas + neg");
    set(bouton_langue, "String", "FR / EN");
    set(bouton_vert, "String", "Image en vert");
    set(bouton_langue, "String", "FR / EN");
    set(bouton_decoupage, "String", "Découpage");
    set(bouton_langue, "String", "FR / EN");
    set(bouton_filtre_median, "String", "Filtre Médian");
    set(bouton_langue, "String", "FR / EN");
    set(bouton_passe_bas, "String", "Passe bas (floue)");
    set(bouton_langue, "String", "FR / EN");
    set(bouton_miroir, "String", "Mode Mirror");
    set(bouton_langue, "String", "FR / EN");
    set(bouton_gradient_seuille, "String", "Gradient seuillé");
    set(bouton_langue, "String", "FR / EN");
    set(bouton_filtre_moyenneur, "String", "Filtre Moyenneur + Bruit");
    set(bouton_langue, "String", "FR / EN");
    set(bouton_seuillage_auto, "String", "Seuillage automatique");
    set(bouton_langue, "String", "FR / EN");
    set(bouton_laplacien, "String", "Calcul laplacien");
    set(bouton_langue, "String", "FR / EN");
    set(bouton_zoom_x2, "String", "Zoom X2");
    set(bouton_langue, "String", "FR / EN");
    set(bouton_rotation_180, "String", "Rotation 180°");
    set(bouton_langue, "String", "FR / EN");
    set(bouton_seuillage_global, "String", "Seuillage Global");
    set(bouton_langue, "String", "FR / EN");
    set(bouton_passe_haut, "String", "Passe haut (contours)");
    set(bouton_langue, "String", "FR / EN");
    set(bouton_histo_normalise, "String", "Histogramme normalisé");
    set(bouton_langue, "String", "FR / EN");
    set(bouton_histo_gris, "String", "Histogramme niveau gris");
    set(bouton_langue, "String", "FR / EN");
    set(bouton_histo_bleu, "String", "Histogramme niveau bleu");
    set(bouton_langue, "String", "FR / EN");
endfunction

   
// Texte pour l'heure et la date

global dateTexte;
dateTexte = uicontrol(f, "Style", "text", ...
          "String", string(date()), ...
          "Position", [40, 650, 220, 30], ...  
          "BackgroundColor",[0.2 0.8 0.95], ...
          "ForegroundColor", [0.6 0 0.8], ...  
          "FontSize", 14, ...  
          "FontName", "Arial", ...  
          "FontWeight", "bold", ...  
          "HorizontalAlignment", "center");
     

// Inteface supplémentaire

// Bouton circulaire "plus" marron clair
bouton_plus = uicontrol(f, ...
    "Style", "pushbutton", ...
    "String", "+", ...
    "Position", [1470, 645, 50, 50], ... // carré → visuel rond
    "BackgroundColor", [0.7 0.5 0.3], ... // marron clair
    "ForegroundColor", [1 1 1], ...
    "FontSize", 22, ...
    "FontWeight", "bold", ...
    "Callback", "plusinfos()");

function plusinfos()
    // Crée une nouvelle fenêtre
    f2 = figure("Position", [300, 400, 750, 600], ...
                "BackgroundColor", [0.93 0.93 0.95], ...
                "Figure_name", "Rapport de Projet");

    // ===== TITRE =====
    uicontrol(f2, ...
        "Style", "text", ...
        "String", "Rapport de Projet – Traitement d’Image", ...
        "Position", [75, 550, 600, 30], ...
        "FontSize", 18, ...
        "FontWeight", "bold", ...
        "ForegroundColor", [0.1 0.1 0.5], ...
        "BackgroundColor", [0.93 0.93 0.95], ...
        "HorizontalAlignment", "center");

// ===== AUTEUR =====
// "Auteur :" en bleu gras
uicontrol(f2, ...
    "Style", "text", ...
    "String", "Auteur :", ...
    "Position", [50, 510, 100, 20], ...
    "FontSize", 12, ...
    "FontWeight", "bold", ...
    "ForegroundColor", [0 0 1], ...   // Bleu
    "BackgroundColor", [0.93 0.93 0.95], ...
    "HorizontalAlignment", "left");

// "nom et prenom
uicontrol(f2, ...
    "Style", "text", ...
    "String", "Koami Emmanuel DOGBE", ...
    "Position", [102, 510, 400, 20], ...
    "FontSize", 12, ...
    "FontWeight", "normal", ...
    "ForegroundColor", [0 0 0], ...   // Noir
    "BackgroundColor", [0.93 0.93 0.95], ...
    "HorizontalAlignment", "left");

 // ===== FORMATION =====
// "Formation :" en vert foncé gras
uicontrol(f2, ...
    "Style", "text", ...
    "String", "Formation:", ...
    "Position", [50, 490, 120, 20], ...
    "FontSize", 12, ...
    "FontWeight", "bold", ...
    "ForegroundColor", [0 0 1], ...   // Vert foncé
    "BackgroundColor", [0.93 0.93 0.95], ...
    "HorizontalAlignment", "left");

// "Master 1 Informatique des Big Data (M1 IBD)" en noir normal
uicontrol(f2, ...
    "Style", "text", ...
    "String", "Master 1 Informatique & Big Data (M1 IBD)", ...
    "Position", [120, 490, 450, 20], ...
    "FontSize", 12, ...
    "FontWeight", "normal", ...
    "ForegroundColor", [0 0 0], ...     // Noir
    "BackgroundColor", [0.93 0.93 0.95], ...
    "HorizontalAlignment", "left");


// ===== UNIVERSITÉ =====
// "Université :" 
uicontrol(f2, ...
    "Style", "text", ...
    "String", "Lieu:", ...
    "Position", [50, 470, 120, 20], ...
    "FontSize", 12, ...
    "FontWeight", "bold", ...
    "ForegroundColor", [0 0 1], ...   
    "BackgroundColor", [0.93 0.93 0.95], ...
    "HorizontalAlignment", "left");

// "Université Paris 8" en noir normal
uicontrol(f2, ...
    "Style", "text", ...
    "String", "Université Paris 8", ...
    "Position", [85, 470, 400, 20], ...
    "FontSize", 12, ...
    "FontWeight", "normal", ...
    "ForegroundColor", [0 0 0], ...       // Noir
    "BackgroundColor", [0.93 0.93 0.95], ...
    "HorizontalAlignment", "left");


    // ===== OBJECTIF =====
    uicontrol(f2, ...
        "Style", "text", ...
        "String", "Objectif :", ...
        "Position", [50, 420, 600, 20], ...
        "FontSize", 13, ...
        "FontWeight", "bold", ...
        "ForegroundColor", [1 0 0], ... 
        "BackgroundColor", [0.93 0.93 0.95], ...
        "HorizontalAlignment", "left");

    uicontrol(f2, ...
        "Style", "text", ...
        "String", "Concevoir une interface graphique interactive pour le traitement d’images numériques.", ...
        "Position", [70, 400, 600, 20], ...
        "FontSize", 12, ...
        "ForegroundColor", [0.1 0.1 0.1], ...
        "BackgroundColor", [0.93 0.93 0.95], ...
        "HorizontalAlignment", "left");
        
    uicontrol(f2, ...
        "Style", "text", ...
        "String","L’outil permet d’appliquer des opérations visuelles et analytiques sur des images importées.", ...
        "Position", [70, 380, 600, 20], ...
        "FontSize", 12, ...
        "ForegroundColor", [0.1 0.1 0.1], ...
        "BackgroundColor", [0.93 0.93 0.95], ...
        "HorizontalAlignment", "left");

    // ===== PRESENTATION =====
    uicontrol(f2, ...
        "Style", "text", ...
        "String", "Présentation de l’interface :", ...
        "Position", [50, 360, 600, 20], ...
        "FontSize", 13, ...
        "FontWeight", "bold", ...
        "ForegroundColor", [0.5 0 0.5], ... // Violet
        "BackgroundColor", [0.93 0.93 0.95], ...
        "HorizontalAlignment", "left");

    uicontrol(f2, ...
        "Style", "text", ...
        "String", "- Zone centrale : affichage de l’image (cadre gris)", ...
        "Position", [70, 340, 600, 20], ...
        "FontSize", 12, ...
        "ForegroundColor", [0.1 0.1 0.1], ...
        "BackgroundColor", [0.93 0.93 0.95], ...
        "HorizontalAlignment", "left");
        
    uicontrol(f2, ...
        "Style", "text", ...
        "String", "- Barre supérieure : date et titre du projet.", ...
        "Position", [70, 320, 600, 20], ...
        "FontSize", 12, ...
        "ForegroundColor", [0.1 0.1 0.1], ...
        "BackgroundColor", [0.93 0.93 0.95], ...
        "HorizontalAlignment", "left");
        
     uicontrol(f2, ...
        "Style", "text", ...
        "String", "- Panneau droit : paramètres regroupés par catégories : Palette de couleurs , Transformations géométriques , Histogrammes, Filtrage , Seillage,         Operations", ...
        "Position", [70, 300, 1000, 20], ...
        "FontSize", 12, ...
        "ForegroundColor", [0.1 0.1 0.1], ...
        "BackgroundColor", [0.93 0.93 0.95], ...
        "HorizontalAlignment", "left");
        
     uicontrol(f2, ...
        "Style", "text", ...
        "String", "- Barre inférieure : actions générales (Importer, Sauvegarder, Quitter, mode clairt/sombre et mode français/anglais)", ...
        "Position", [70, 280, 1000, 20], ...
        "FontSize", 12, ...
        "ForegroundColor", [0.1 0.1 0.1], ...
        "BackgroundColor", [0.93 0.93 0.95], ...
        "HorizontalAlignment", "left");


    // ===== FONCTIONNALITÉS =====
    uicontrol(f2, ...
        "Style", "text", ...
        "String", "Fonctionnalités interactives :", ...
        "Position", [50, 260, 600, 20], ...
        "FontSize", 13, ...
        "FontWeight", "bold", ...
        "ForegroundColor", [0 0.3 0.6], ... // Bleu foncé
        "BackgroundColor", [0.93 0.93 0.95], ...
        "HorizontalAlignment", "left");

     uicontrol(f2, ...
        "Style", "text", ...
        "String", "- Bouton circulaire ''+'' : ouvre cette fenêtre", ...
        "Position", [70, 240, 1000, 20], ...
        "FontSize", 12, ...
        "ForegroundColor", [0.1 0.1 0.1], ...
        "BackgroundColor", [0.93 0.93 0.95], ...
        "HorizontalAlignment", "left");
        



    // ===== ASPECTS TECHNIQUES =====
    uicontrol(f2, ...
        "Style", "text", ...
        "String", "Aspects techniques :", ...
        "Position", [50, 200, 600, 20], ...
        "FontSize", 13, ...
        "FontWeight", "bold", ...
        "ForegroundColor", [0.6 0.3 0], ... // Marron
        "BackgroundColor", [0.93 0.93 0.95], ...
        "HorizontalAlignment", "left");
        
     uicontrol(f2, ...
        "Style", "text", ...
        "String", "- Développement en Scilab avec uicontrol, figure, xstringb, xfarc", ...
        "Position", [70, 180, 1000, 20], ...
        "FontSize", 12, ...
        "ForegroundColor", [0.1 0.1 0.1], ...
        "BackgroundColor", [0.93 0.93 0.95], ...
        "HorizontalAlignment", "left");
        
     uicontrol(f2, ...
        "Style", "text", ...
        "String", "  - Interface ergonomique et modulaire", ...
        "Position", [70, 160, 1000, 20], ...
        "FontSize", 12, ...
        "ForegroundColor", [0.1 0.1 0.1], ...
        "BackgroundColor", [0.93 0.93 0.95], ...
        "HorizontalAlignment", "left");


    // ===== BOUTON FERMER =====
    uicontrol(f2, ...
        "Style", "pushbutton", ...
        "String", "Fermer", ...
        "Position", [320, 20, 100, 30], ...
        "FontSize", 12, ...
        "BackgroundColor", [0.7 0.2 0.2], ...
        "ForegroundColor", [1 1 1], ...
        "Callback", "close(f2)");
endfunction



