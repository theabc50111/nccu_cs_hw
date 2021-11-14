SELECT COUNT(*)
FROM (public.crew as c
	 JOIN 
	 public.people as p ON c.person_id = p.person_id)
WHERE c.title_id in (
	SELECT a.title_id
	FROM public.akas as a
	WHERE a.title LIKE '%Robert Downey Jr.%'
	)
	AND c.category = 'actresses'