SELECT AVG(rating)
FROM public.ratings as r, public.crew as c, public.people as p
WHERE r.title_id = c.title_id AND c.person_id = p.person_id AND p.name = 'Robert Downey Jr.'
GROUP BY p.name;