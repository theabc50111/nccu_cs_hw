SELECT p.name
FROM public.people as p
WHERE p.person_id IN(
	SELECT c.person_id
	FROM public.ratings as r
		 JOIN
		 public.crew as c ON r.title_id = c.title_id
		 JOIN 
		 public.people as p ON c.person_id = p.person_id
	WHERE c.category = 'composer'
		  AND r.rating > 8
	GROUP BY c.person_id
	HAVING COUNT(*)>10)
ORDER BY p.name;