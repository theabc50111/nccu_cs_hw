SELECT DISTINCT p.name,p.born
FROM public.people as p, public.crew as c ,public.titles as t 
WHERE c.category = 'actor'
	AND c.title_id = t.title_id
	AND c.person_id = p.person_id
	AND (t.premiered - p.born) <0