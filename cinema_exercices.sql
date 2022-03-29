a.

SELECT titre, date_sortie, TIME_FORMAT(SEC_TO_TIME(duree * 60), "%H:%i") AS duree, nom_realisateur
	FROM
		film f
	INNER JOIN
		realisateur r
	ON
		f.id_realisateur = r.id_realisateur

b.

SELECT titre, TIME_FORMAT(SEC_TO_TIME(duree * 60), "%H:%i") AS duree
	FROM
		film f
	WHERE
		duree > 135
	ORDER BY
		duree DESC

c.

SELECT titre, date_sortie, nom_realisateur
	FROM
		film f
	INNER JOIN
		realisateur r
	ON
		f.id_realisateur = r.id_realisateur
	WHERE
		r.nom_realisateur = 'Calamar'

d.

SELECT libelle, COUNT(id_film) AS nombre_films
	FROM
		genre g
	LEFT JOIN
		categoriser c
	ON
		g.id_genre = c.id_genre
	GROUP BY
		libelle
	ORDER BY
		nombre_films DESC

e.

SELECT nom_realisateur, COUNT(f.id_realisateur) AS nombre_films
	FROM
		realisateur r
	LEFT JOIN
		film f
	ON
		r.id_realisateur = f.id_realisateur
	GROUP BY
		nom_realisateur
	ORDER BY
		nombre_films DESC

f.

SELECT titre, nom_acteur, nom_personnage
	FROM
		casting c
	INNER JOIN
		film f 
	ON
		c.id_film = f.id_film
	INNER JOIN		
		acteur a
	ON
		c.id_acteur = a.id_acteur
	INNER JOIN
		role r
	ON
		c.id_role = r.id_role
	WHERE
		f.titre = 'Seavengers : Rassemblement'

g.

SELECT nom_acteur, nom_personnage, titre, DATE_FORMAT(date_sortie, "%d/%m/%Y") AS date_sortie
	FROM
		casting c
	INNER JOIN
		film f 
	ON
		c.id_film = f.id_film
	INNER JOIN		
		acteur a
	ON
		c.id_acteur = a.id_acteur
	INNER JOIN
		role r
	ON
		c.id_role = r.id_role
	WHERE
		a.nom_acteur = 'Krabs'

h.

SELECT nom_acteur
	FROM
		acteur a
	INNER JOIN
		realisateur r
	ON
		a.nom_acteur = r.nom_realisateur

i.

SELECT titre, DATE_FORMAT(date_sortie, "%d/%m/%Y") AS date_sortie
	FROM
		film f
	WHERE
		f.date_sortie > DATE_SUB(NOW(), INTERVAL 5 YEAR)
	ORDER BY
		f.date_sortie DESC

j.

SELECT sexe, COUNT(id_acteur) AS nombre_acteurs
	FROM
		acteur a
	GROUP BY
		sexe

k.

SELECT a.nom_acteur, TIMESTAMPDIFF(YEAR, a.date_naissance, NOW()) AS age
	FROM
		acteur a
	HAVING
		age >= 50

l.

SELECT a.nom_acteur, COUNT(id_film) AS nombre_films
	FROM
		acteur a
	LEFT JOIN
		casting c
	ON
		a.id_acteur = c.id_acteur
	GROUP BY
		a.nom_acteur
	HAVING
		nombre_films >= 3