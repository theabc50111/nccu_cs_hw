SELECT DISTINCT p.name, p.born
FROM public.people as p
	 JOIN
	 public.crew as c ON c.person_id = p.person_id
	 JOIN
	 public.titles as t ON t.title_id = c.title_id
WHERE c.category = 'actor'
	  AND (t.premiered - p.born) <= 20
	  and (t.premiered-p.born) >=0
ORDER BY p.name