# Déploiement Automatisé d'un Site Web avec Docker et Ansible

## Description

Ce projet a pour but de déployer un site Web (par exemple, un blog WordPress) et l'infrastructure nécessaire sur une instance fournie par un fournisseur de cloud. Chaque processus du système sera exécuté dans un conteneur séparé (un conteneur par processus). L'objectif est d'assurer l'automatisation du déploiement à l'aide d'un outil de votre choix, comme **Ansible**.

Le serveur web complet devra être capable d'exécuter plusieurs services en parallèle, tels que :
- WordPress
- Base de données MySQL/MariaDB
- PHPMyAdmin

## Fonctionnalités

### 1. Conteneurisation des services

Chaque composant de votre application sera exécuté dans un conteneur Docker distinct, conformément au principe "un processus = un conteneur". Cela garantit que chaque service est isolé et peut être géré indépendamment.

### 2. Automatisation du déploiement

L'intégralité du processus de déploiement sera automatisée via un outil d'automatisation comme **Ansible**. Cela inclut :
- L'installation de l'environement Docker dans le serveur.
- La configuration du réseau entre les conteneurs pour permettre leur communication.
- La mise a jour des variables d'environnements.
- Le lancement des Dockers (Nginx, MariaDB, Wordpress, Phpmyadmin), et la creation des volumes.

### 3. Déploiement sur un serveur cloud

Le déploiement se fera sur une instance fournie par un fournisseur de cloud (par exemple, AWS, Google Cloud, **Azure**, etc.).

### 4. Multi-serveur

Le déploiement doit être scalable, ce qui signifie que vous pouvez déployer les services sur plusieurs serveurs si nécessaire. Les conteneurs doivent pouvoir communiquer entre eux pour garantir le bon fonctionnement de l'application.

### 5. Sécurisation du serveur

L'accès aux services doit être sécurisé. Par exemple :
- L'accès à la base de données MySQL depuis l'extérieur doit être restreint.
- L'authentification pour accéder à PHPMyAdmin doit être configurée.
- Le serveur Web doit être sécurisé, avec un certificat TLS pour assurer une communication sécurisée.

## Étapes d'Installation

### 1. Clonez le repository

```bash
git clone git@github.com:shikalou/cloud-1.git
cd cloud-1
```

### 2. Definissez les variables d'environnement necessaires
```bash
vim inception/srcs/.env
```
exemple de fichier :
```
SQL_DATABASE=<NOM DE DB>
SQL_ROOT_PASSWORD=<MDP DE DB>
SQL_USER=<DB USERNAME>
SQL_PASSWORD=<DB MOT DE PASSE>
DOMAIN_NAME=TO_CHANGE (set dans le playbook)
ADMIN_USER=<ADMIN USERNAME>
ADMIN_PASSWORD=<ADMIN MOT DE PASSE>
ADMIN_EMAIL=<ADMIN MAIL>
USER1_LOGIN=<USER USERNAME>
USER1_PASSWORD=<USER MOT DE PASSE>
USER1_MAIL=<USER MAIL>
```
### 3. Definissez le fichier inventory avec les addresses IP publique des serveurs et host name
exemple de fichier :
```
[web_servers]
cloud1 ansible_host=XX.XX.XX.XX ansible_user=username
cloud2 ansible_host=XX.XX.XX.XX ansible_user=username
```
### 4. Lancez le script d'automatisation d'installation
```bash
ansible-playbook -i inventory.ini  playbook/run.yml
```