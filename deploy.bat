@echo off
chcp 65001 >nul
echo =======================================================
echo    Mise a jour de l'Escape Game sur GitHub Pages
echo =======================================================
echo.

:: Vérifier si git est initialisé
IF NOT EXIST ".git" (
    echo [1/4] Initialisation du depot Git local...
    git init
    git branch -M main
) ELSE (
    echo [1/4] Depot Git local deja initialise.
)

:: Vérifier si le lien vers GitHub est configuré
git remote | findstr "origin" >nul
IF ERRORLEVEL 1 (
    echo.
    echo ATTENTION: Le lien vers votre depot GitHub n'est pas configure.
    echo Veuillez d'abord creer un depot VIDE sur GitHub (sans README ni licence).
    set "repoUrl=https://github.com/nonodu620-528/escape-game.git"
    git remote add origin %repoUrl%
)

echo.
echo [2/4] Enregistrement des modifications du fichier index.html...
git add index.html

echo.
echo [3/4] Creation du point de sauvegarde (commit)...
git commit -m "Mise a jour de l'escape game"

echo.
echo [4/4] Envoi des donnees vers GitHub...
git push -u origin main

echo.
echo =======================================================
echo TERMINE ! Les fichiers ont ete envoyes.
echo.
echo [IMPORTANT] Pour que le site soit visible sur internet :
echo 1. Allez sur votre depot GitHub dans votre navigateur.
echo 2. Allez dans "Settings" (Parametres) en haut a droite.
echo 3. A gauche, cliquez sur "Pages".
echo 4. Sous "Build and deployment", choisissez "Branch: main" et "Folder: / (root)", puis cliquez sur "Save".
echo 5. Attendez quelques minutes, votre lien (https://votre-pseudo.github.io/votre-repo/) apparaitra en haut de la page Pages !
echo =======================================================
pause
