# Clothed
## Objectif du projet

L’objectif de ce projet est de développer une application légère inspirée de VINTED, permettant l'achat de vêtements. Dans le cadre du développement, nous allons définir une version MVP (Minimum Viable Product) pour obtenir des retours clients avec un minimum d'effort. En parallèle, nous adopterons les méthodologies agiles et rédigerons des User Stories pour exprimer les différents besoins. Chaque User Story composant le MVP sera préfixée de [MVP] dans son titre.

## Principales fonctionnalités du projet

- **Gestion des utilisateurs** : Connexion et déconnexion du profil utilisateurs.
- **Catalogue de produits** : Affichage des produits disponibles avec des détails et des images.
- **Panier d'achat** : Ajout et suppression de produits dans le panier.

## Présentation du workspace

Le workspace `clothed` est structuré pour faciliter le développement et la maintenance de l'application. Il comprend les dossiers suivants :
- **lib/** : Contient le code source de l'application Flutter, organisé selon une architecture MVC (Modèle-Vue-Contrôleur) pour améliorer la lisibilité et la maintenabilité du code.
- **assets/** : Contient les ressources telles que les images et les fichiers de configuration.
- **test/** : Contient les tests unitaires et d'intégration pour assurer la qualité du code.

Ce projet utilise Flutter pour créer une application mobile multiplateforme performante et réactive.

## L'application
### Pages de l'application

1. **Page de Connexion** :
   - Permet à l'utilisateur de se connecter en utilisant son email et son mot de passe.
   - Redirige vers la page principale après une connexion réussie.

2. **Page de Profil** :
   - Affiche les informations de profil de l'utilisateur (login, mot de passe, anniversaire, adresse, code postal, ville). *problème technique*
   - Permet à l'utilisateur de modifier ses informations de profil et de les sauvegarder. *problème technique*
   - Inclut un bouton pour se déconnecter.

3. **Page de Catalogue de Produits** :
   - Affiche une liste de vêtements disponibles à l'achat avec des détails et des images.
   - Permet de cliquer sur un produit pour voir plus de détails.

4. **Page de Détail du Produit** :
   - Affiche les détails d'un vêtement spécifique, y compris l'image, le titre, la catégorie, la taille, la marque et le prix.
   - Permet d'ajouter le vêtement au panier.

5. **Page du Panier** :
   - Affiche les vêtements ajoutés au panier.
   - Permet de supprimer des vêtements du panier.
   - Affiche le total des prix des vêtements dans le panier.

6. **Page d'Ajout de Vêtement** :
   - Permet d'ajouter un nouveau vêtement au catalogue en fournissant des informations telles que l'URL de l'image, le titre, la taille, la marque et le prix.
   - *La catégorie par défaut est "haut"*

## Utilisateur
- **Email** : clementloze@hotmail.fr
- **Mot de passe** : pwd123