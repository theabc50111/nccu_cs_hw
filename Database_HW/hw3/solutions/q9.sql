SELECT DISTINCT p.name
FROM public.people AS p 
	 JOIN
	 public.crew AS c ON c.person_id = p.person_id
WHERE c.title_id IN(
	SELECT c.title_id
	FROM (public.crew as c
		  JOIN 
		  public.people as p ON c.person_id = p.person_id)
	WHERE p.name = 'Jennifer Lawrence'
)
ORDER BY p.name;