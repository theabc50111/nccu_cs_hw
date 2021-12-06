SELECT DISTINCT p.name
FROM ((public.titles as t
	   JOIN
	   public.crew as c ON t.title_id = c.title_id)
	   JOIN
	   public.people as p ON p.person_id = c.person_id)
WHERE t.title_id IN(
		SELECT a.title_id
		FROM public.akas as a
		WHERE a.region = 'JP')
	  AND t.genres LIKE '%Action%'
	  AND t.type = 'movie'
	  AND c.category = 'actress'
	  AND t.premiered BETWEEN 1991 AND 2000
ORDER BY p.name ASC;