SELECT AVG(r.rating)
FROM 
	(((public.ratings as r 
	   JOIN 
	   		public.crew as c ON r.title_id = c.title_id)
	   JOIN
	 		public.titles as t ON r.title_id = t.title_id)
	   JOIN
	 		public.people as p ON c.person_id = p.person_id)
WHERE t.type = 'movie'
	  AND p.name = 'Robert Downey Jr.';
	 		

-- SELECT AVG(rating)
-- FROM public.ratings as r, public.crew as c, public.people as p, public.titles as t
-- WHERE r.title_id = c.title_id 
--       AND c.person_id = p.person_id 
--       AND p.name = 'Robert Downey Jr.' 
-- 	  AND t.title_id = r.title_id
--       AND t.type = 'movie';